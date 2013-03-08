
class ServerApiImpl extends haxe.remoting.AsyncProxy<ServerApi> {
}



import com.bit101.components.VBox;
//import mconsole.Console;
import com.bit101.components.Label;
import com.bit101.components.PushButton;
import flash.net.XMLSocket;
import flash.events.Event;
import flash.events.DataEvent;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import flash.Lib;
import flash.text.TextField;
import flash.external.ExternalInterface;
import com.bit101.components.ColorChooser;



class Client implements ClientApi {



public static var fakedata:String='<div class="container"><div class="row"><div class="span3"><div class="pataf" style="width:34px;
			height:36px;
			background:#ffff00;
			margin-top:75px;
			margin-left:80px;
			"><![CDATA[nope]]></div></div><div class="span2"><![CDATA[nope]]></div><div class="span2"><![CDATA[nope]]></div><div class="span3"><![CDATA[nope]]></div></div><div class="row"><div class="span5"><div class="row"><div class="span2"><![CDATA[nope]]></div><div class="span1"><div class="pataf" style="width:35px;
			height:39px;
			background:#000000;
			margin-top:33px;
			margin-left:14px;
			"><![CDATA[nope]]></div></div></div><div class="pataf" style="width:79px;
			height:173px;
			background:#ffff00;
			margin-top:265px;
			margin-left:60px;
			"><div class="pataf" style="width:47px;
			height:36px;
			background:#000000;
			margin-top:15px;
			margin-left:13px;
			"><![CDATA[nope]]></div></div></div><div class="span6"><div class="pataf" style="width:451px;
			height:129px;
			background:#cc0000;
			margin-top:32px;
			margin-left:11px;
			"><div class="pataf" style="width:103px;
			height:36px;
			background:#9900cc;
			margin-top:37px;
			margin-left:29px;
			"><![CDATA[nope]]></div></div><div class="row"><div class="span3"><div class="pataf" style="width:133px;
			height:107px;
			background:#9900cc;
			margin-top:21px;
			margin-left:17px;
			"><![CDATA[nope]]></div></div><div class="span3"><div class="pataf" style="width:51px;
			height:50px;
			background:#9900cc;
			margin-top:43px;
			margin-left:40px;
			"><![CDATA[nope]]></div><div class="pataf" style="width:70px;
			height:46px;
			background:#9900cc;
			margin-top:97px;
			margin-left:121px;
			"><![CDATA[nope]]></div></div></div><div class="pataf" style="width:438px;
			height:87px;
			background:#cc0000;
			margin-top:391px;
			margin-left:12px;
			"><![CDATA[nope]]></div></div></div><div class="row"><div style="width:39px;
			height:85px;
			background:#33cc00;
			margin-top:4px;
			margin-left:380px;
			" class="pataf"><![CDATA[nope]]></div><div class="span2"><![CDATA[nope]]></div><div class="span2"><![CDATA[nope]]></div></div></div>';
public static var fakedata2:String='<div class="pataf" style="width:79px;
			height:173px;
			background:#ffff00;
			margin-top:265px;
			margin-left:60px;
			">popo</div>
			';
	var s:XMLSocket;
	var api : ServerApiImpl;
	var name : String;
	var tf : flash.text.TextField;
	var log : TextField;

	function new() {
	var hbox:VBox= new VBox(Lib.current,300);
	var connector:PushButton = new PushButton(hbox,0,0,"connect",connect);
	var disconnector:PushButton = new PushButton(hbox,0,0,"disconnect",disconnect);
	var sendToHTML:PushButton= new PushButton(hbox,0,0,"send",onClick);
}

function disconnect(?arg:Dynamic) 
{
	trace("disconnect");
	s.removeEventListener(Event.CONNECT, connectHandler);
s.removeEventListener(DataEvent.DATA, dataHandler);
s.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
s.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
s.close();
}
function connect(?arg:Dynamic) 
{
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
		api = new ServerApiImpl(scnx.api);
	var stage=Lib.current.stage;
	//stage.addEventListener(flash.events.MouseEvent.CLICK,onClick);
	ExternalInterface.addCallback("IsFwCallbackInstalled",IsFwCallbackInstalled);
	//ExternalInterface.addCallback("onFwDocumentSave",onFWEvent);
	ExternalInterface.addCallback("setfwActiveToolForSWFs",setfwActiveToolForSWFs);
}
function setfwActiveToolForSWFs( newTool:String)
{	
	 trace( "popo"+ newTool);
	 send(newTool);
}


function IsFwCallbackInstalled( funcName:String):Bool
{
	trace("cool");
	switch( funcName )
	{
		case "onFwDocumentOpen":
			return true;			
			
		case "onFwDocumentClose":
			return true;
			
		case "onFwActiveToolChange":
			return true;
			
		case "setfwActiveToolForSWFs":
			return true;
	}
	return false;
}
function onClick(e) 
{
	trace("clicko");
	//send("popo");
	
	var data:String=getFWData();
	// trace("rawData="+data);
	// trace("data="+data);
	// trace("after data");
	
	var serix:String=haxe.Serializer.run(fakedata2);
	send(data);
	trace("after send");
}
function getFWData():String
{
	var cmd = 'function getAnnotation(){'
   +'   var data = {};'
   +'   if (fw.selection.length) data = fw.selection[0].customData;'
   +'   else if (fw.getDocumentDOM()) data = fw.getDocumentDOM().pngText;'
   +'   return (data != undefined) ? data.HTML : "couac";'
   +'}'
   +'getAnnotation();';
   
   var variable_str =  untyped __global__["adobe.utils.MMExecute"](cmd);
  
   //var variable_str=Reflect.callMethod(__global__,"MMExecute",[cmd]);
   //trace("afeter"+variable_str);
   return variable_str;
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
		api.say(text);
	}

	public function userJoin( name:String ) {
		display("User join <b>"+name+"</b>");
	}

	public function userLeave( name:String ) {
		display("User leave <b>"+name+"</b>");
	}

	public function userSay( text : String ) {
		trace("userSay");
		//display("<b>"+name+ " :</b> "+text.split("&").join("&amp;").split("<").join("&lt;").split(">").join("&gt;"));
		display("text="+text);
	}

	function display( line : String ) {
		//log.text += line + "<br>";
		trace("log"+line);
	}

	// --

	static var c : Client;

	static function main() {
		//Console.start();
		c = new Client();
		
	}


	function connectHandler(event:Event):Void {
    trace("connected to XMLSocket");
    onConnect(true);
}

function dataHandler(event:DataEvent):Void {
 //    trace("data: "+event.data.toString());
 //    var text:Dynamic=null;
 //    try{
    
 //    text=haxe.Unserializer.run(event.data.toString().substr(3));
 //   trace(text);
	// }catch(msg:String){
	// 	trace("msg="+msg);
	// }
	//  Reflect.callMethod(this,text[1],null);
//display("<b>"+name+ " :</b> "+text.split("&").join("&amp;").split("<").join("&lt;").split(">").join("&gt;"));
    //var t= haxe.Unserializer.run(event.data);
   // trace("t="+t);
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

}
