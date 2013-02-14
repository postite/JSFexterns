
package jsf;


typedef FrameNLayerIntersection={
	var elements :Array<Element>; /* Array of Element objects (see Element object).*/ 
var elemsandsublayers:Array<Element>; /* Array of elements and sublayers obtained
from topLayers.*/ 
var locked:Bool; /* If set to true, this FrameNLayerIntersection
object is locked. The default value is false.*/ 
var name:String; /* Specifies the name of the layer when the
layers are accessed from states.*/ 
var visible:Bool; /* If set to false, this FrameNLayerIntersection
object is hidden. The default value is true. */ 
}





typedef Frame = {

	var delay:Int; /* Hundredths of a second.*/ 
var disposal:String; /* Acceptable values are "unspecified", "none", "background",
and "previous".*/ 
var layers :Array<FrameNLayerIntersection>; /* Array of FrameNLayerIntersection objects
in the document (see FrameNLayerIntersection object).*/ 
var name:String; /* Specifies the name of the state.*/ 
var topLayers:Array<FrameNLayerIntersection>; /* Array of top layers returned as FrameNLayerIntersection objects.*/ 
var visible:Bool; /* If set to false, this frame
is hidden. Default value is true. */ 

}