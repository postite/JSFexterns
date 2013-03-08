package jsf.objects;
import jsf.objects.elements.Element;


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