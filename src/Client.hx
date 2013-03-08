class Client 
{
	function new()
	{
		neko.Lib.print(new ClientView().execute(null));
	}

	static public function main()
	{
		var app = new Client();
	}
}
@:includeTemplate("../view/test2.html")
class ClientView extends erazor.macro.Template<Dynamic>{}