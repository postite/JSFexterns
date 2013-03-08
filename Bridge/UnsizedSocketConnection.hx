import haxe.remoting.SocketConnection;
import haxe.remoting.SocketProtocol.Socket;
import haxe.remoting.SocketProtocol;
import haxe.remoting.Context;

class UnsizedSocketConnection extends SocketConnection {
	private var finalMessage : String;	
	
	override function new(data,path) {
		super(data, path);
		this.finalMessage = "";
	}
	
	public override function processMessage( data : String ) {
		var request;
		var proto = __data.protocol;
		
		//concat data received with finalMessage to construct the entire message
		this.finalMessage += data.substr(0, data.length - 1);
				
		if (data.charAt(data.length - 1) == "0") { //it's the final part of my message so finalMessage contains my entire message
			data = proto.decodeData(finalMessage);
			this.finalMessage = ""; //reset finalMessage
			
			try {
				request = proto.isRequest(data);
			} catch( e : Dynamic ) {
				var msg = Std.string(e) + " (in "+StringTools.urlEncode(data)+")";
				__data.error(msg); // protocol error
				return;
			}
			// request
			if( request ) {
				try proto.processRequest(data,__data.log) catch( e : Dynamic ) __data.error(e);
				return;
			}
			// answer
			var f = __data.results.pop();
			if( f == null ) {
				__data.error("No response excepted ("+data+")");
				return;
			}
			var ret;
			try {
				ret = proto.processAnswer(data);
			} catch( e : Dynamic ) {
				f.onError(e);
				return;
			}
			if ( f.onResult != null ) f.onResult(ret);
		}		
	}	
	
	#if (flash || js || neko)
	public static function create( s : Socket, ?ctx : Context ) {
		var data = {
			protocol : new SocketProtocol(s,ctx),
			results : new List(),
			error : function(e) throw e,
			log : null,
			#if !flash9
			#if (flash || js)
			queue : new haxe.TimerQueue(),
			#end
			#end
		};
		var sc = new UnsizedSocketConnection(data, []);
		data.protocol = new UnsizedSocketProtocol(s, ctx);
		
		data.log = sc.defaultLog;
		#if flash9
		s.addEventListener(flash.events.DataEvent.DATA, function(e : flash.events.DataEvent) {
			var data = e.data;
			var msgLen = sc.__data.protocol.messageLength(data.charCodeAt(0),data.charCodeAt(1));
			if( msgLen == null || data.length != msgLen - 1 ) {
				sc.__data.error("Invalid message header");
				return;
			}
			sc.processMessage(e.data.substr(2,e.data.length-2));
		});
		#elseif (flash || js)
		// we can't deliver directly the message
		// since it might trigger a blocking action on JS side
		// and in that case this will trigger a Flash bug
		// where a new onData is called is a parallel thread
		// ...with the buffer of the previous onData (!)
		s.onData = function( data : String ) {
			sc.__data.queue.add(function() {
				var msgLen = sc.__data.protocol.messageLength(data.charCodeAt(0),data.charCodeAt(1));
				if( msgLen == null || data.length != msgLen - 1 ) {
					sc.__data.error("Invalid message header");
					return;
				}
				sc.processMessage(data.substr(2,data.length-2));
			});
		};
		#end
		return sc;
	}
	#end
}


class UnsizedSocketProtocol extends SocketProtocol {
	public static var MAXSTRINGSIZE : Int = 4091;

	private function cutAndSendMessage(message : String) : Void {
		var ttSize = message.length;
		var lastMessage = false;
		
		while (!lastMessage) {
			lastMessage = (message.length <= UnsizedSocketProtocol.MAXSTRINGSIZE);
			//send the substr message
			sendMessage(message.substr(0, UnsizedSocketProtocol.MAXSTRINGSIZE) + (lastMessage ? "0" : "1"));
			//save into message the remaining string
			message = message.substr(UnsizedSocketProtocol.MAXSTRINGSIZE, ttSize);
		}
	}
	
	override public function sendRequest( path : Array<String>, params : Array<Dynamic> ) {
		var s = new haxe.Serializer();
		s.serialize(true);
		s.serialize(path);
		s.serialize(params);
		
		cutAndSendMessage(s.toString());
	}
	
	override public function sendAnswer( answer : Dynamic, ?isException : Bool ) {
		var s = new haxe.Serializer();
		s.serialize(false);
		if( isException )
			s.serializeException(answer);
		else
			s.serialize(answer);
				
		cutAndSendMessage(s.toString());
	}	
}