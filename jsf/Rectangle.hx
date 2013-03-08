/*Rectangle data Type*/

/*
The format for a rectangle is {left:float, top:float, right: float, bottom: float}. For instance, dom.addNewOval(boundingRectangle) could look like the following example:

fw.getDocumentDOM().addNewOval({left:72, top:79, right:236, bottom:228});

*/

package jsf;

typedef Rectangle={
	left:Float,
	top:Float,
	right:Float,
	bottom:Float,
	?width:Float,
	?height:Float

}