package;

import jsf.Fw;

class Test 
{
	function new()
	{
		Fw.getDocumentDOM().addNewOval(cast {left:72, top:79, right:236, bottom:228});
	}

	public static function main(){

		new Test();
	}
}