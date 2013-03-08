import js.JQuery;
import js.Lib;

class JSconnection 
{
static var current:JQuery;
static function foo(x,y) { trace("tip");return x + y; }

static function log(s:String){ 
  trace("from FW"+s);
  //var unseri=haxe.Unserializer.run(s);
  trace("un="+s);
  display(s);
}


static function display(data:String) 
{
  trace ("to append="+data);
  if( current!=null)current.remove();
  current=new JQuery(data).appendTo("body");
  //new JQuery("body").append(data);
}
	function new() 
	{
	new JQuery(Lib.document).ready(init);
  

	}

  function activeGrid(e:JqEvent) 
  {
    trace("active grid");
    new JQuery("<img class='grid' src='grid.png'>").appendTo(new JQuery(".container"));
  }
  var cnx = null;

  static function main() {
    
    new JSconnection();
    //run();
  }
function init(e) 
{
	new JQuery("#but").click(activeGrid);
	var ctx = new haxe.remoting.Context();
    ctx.addObject("JSconnection",JSconnection);
    cnx = haxe.remoting.ExternalConnection.flashConnect("default","MyFlash",ctx);
	haxe.Timer.delay(run,1000);
}
   function run() {
  	trace("run");
    trace(cnx.Bridge.foo.call([1,2]));
  }
}