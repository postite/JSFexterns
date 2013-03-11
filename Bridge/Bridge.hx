// @:native("adobe.utils")
// extern class MMExecute{
// 	static function _MMExecute(s:String):String;
// }
class ServerApiImpl2 extends haxe.remoting.AsyncProxy<ServerApi> {
}

import flash.net.XMLSocket;
import flash.events.Event;
import flash.events.DataEvent;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import flash.Lib;
import flash.text.TextField;

class Bridge implements ClientApi {
	var s:XMLSocket;
	var api : ServerApiImpl2;
	var name : String;
	var tf : flash.text.TextField;
	var log : TextField;

	function new() {
		 s = new XMLSocket();
		
		
s.addEventListener(Event.CONNECT, connectHandler);
s.addEventListener(DataEvent.DATA, dataHandler);
s.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
s.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
//socket.connect(hostName, port);

		s.connect("localhost",1024);
		var context = new haxe.remoting.Context();
		context.addObject("client",this);
		var scnx = haxe.remoting.SocketConnection.create(s,context);
		//var scnx= UnsizedSocketConnection.create(s,context);
		api = new ServerApiImpl2(scnx.api);
	var stage=Lib.current.stage;
stage.addEventListener(flash.events.MouseEvent.CLICK,onClick);


}

function onClick(e) 
{
	trace("click");

	//trace(untyped __global__["flash.system.fscommand"]("fullscreen","true"));
	
	// untyped adobe.utils.MMExecute("pop");
	//untyped __global__["adobe.utils.MMExecute"]("arg");
	trace("op");
	send("tada");
}
function transmitHtml(e:String) 
{
	//var serix=haxe.Serializer.run(e);
	js.JSconnection.log.call([e]);
}
function transmitCss(e:String) 
{
	//var serix=haxe.Serializer.run(e);
	js.JSconnection.css.call([e]);
}
	function onConnect( success : Bool ) {
		if( !success ) {
			trace("Failed to connect on server !");
			return;
		}
		// create an input textfield
		tf= new TextField();
		Lib.current.addChild (tf);
		// tf = flash.Lib.current.createTextField("tf",0,5,flash.Stage.height - 25,flash.Stage.width-10,20);
		// tf.type = "input";
		// tf.border = true;
		// tf.background = true;
		// tf.backgroundColor = 0xEEEEEE;
		// flash.Key.onKeyDown = onKeyDown;
		// // create a chat log
		log= new TextField();
		Lib.current.addChild (log);
		// log = flash.Lib.current.createTextField("log",1,5,5,flash.Stage.width-10,flash.Stage.height - 35);
		// log.background = true;
		// log.backgroundColor = 0xFFFFFF;
		// log.html = true;
		// log.border = true;
		// log.multiline = true;
		api.identify(Std.string(Math.random()*100));
		display("Please enter your name in the bottom textfield to login and press ENTER");
		trace("connected");
	}

	function onKeyDown() {
		// ENTER pressed ?
		// if( flash.Key.getCode() == 13 ) {
		// 	var text = tf.text;
		// 	tf.text = "";
		// 	send(text);
		// }
	}

	function send( text : String ) {
		// if( name == null ) {
		// 	name = text;
		// 	api.identify(name);
		// 	return;
		// }
		api.doHtml(text);
	}

	public function userJoin( name:String ) {
		display("User join <b>"+name+"</b>");
	}

	public function userLeave( name:String ) {
		display("User leave <b>"+name+"</b>");
	}

	// public function userSay( text : String ) {
	// 	transmit(text);
	// 	//display("<b>"+name+ " :</b> "+text.split("&").join("&amp;").split("<").join("&lt;").split(">").join("&gt;"));
	// 	display("text="+text);
	// }
public function userdoHtml( text : String ) {
		//trace("userSay");
		transmitHtml(text);
		//display("<b>"+name+ " :</b> "+text.split("&").join("&amp;").split("<").join("&lt;").split(">").join("&gt;"));
		//display("text="+text);
	}
	public function userdoCss( text : String ) {
		trace("userdocssfrom bridge");
		//display("<b>"+name+ " :</b> "+text.split("&").join("&amp;").split("<").join("&lt;").split(">").join("&gt;"));
		transmitCss(text);
		//display("text="+text);
	}
	function display( line : String ) {
		
		//log.text += line + "<br>";
		trace("log="+line);
	}

	// --

	static var c : Bridge;

	static function main() {
		c = new Bridge();
	}


	function connectHandler(event:Event):Void {
    trace("connected to XMLSocket");
    onConnect(true);
    external();
}

function dataHandler(event:DataEvent):Void {
	
	
    trace("data: " + event.data);
    
}    

function ioErrorHandler(event:IOErrorEvent):Void {
    trace("ioErrorHandler: " + event);
}

function progressHandler(event:ProgressEvent):Void {
    trace("progressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
}

function securityErrorHandler(event:SecurityErrorEvent):Void {
    trace("securityErrorHandler: " + event);
}



/////// externalconnection stuff///

static var js:haxe.remoting.ExternalConnection;
static function foo(x,y) { return x + y; }

static function external() {
    var ctx = new haxe.remoting.Context();
    ctx.addObject("Bridge",Bridge);
     js = haxe.remoting.ExternalConnection.jsConnect("default",ctx);
    trace(js.JSconnection.foo.call([1,2]));
  }
}
