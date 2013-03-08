package jsf.objects;

import jsf.objects.Layer;
import jsf.objects.elements.Element;
import jsf.objects.FrameNLayerIntersection;



extern class Layer  {
	var disclosure:Bool; /* If set to true, the Layers
list displays all the objects in the layer. If set to false,
only the name of the layer appears.*/ 
var elems:Array<Element>; /* Array<> of elements inside a layer which also
include sublayers.*/ 
var frames :Array<FrameNLayerIntersection>; /* An Array<> of FrameNLayerIntersection objects
(see FrameNLayerIntersection object).*/ 
var isLayer:Bool; /* Always true for a layer.*/ 
var layerType :String; /* Acceptable values are "normal" and "web".*/ 
var name:String; /* Might be null (removes
any existing name).*/ 
var sharing:String; /* Acceptable values are "shared" and "not shared".*/ 
	

}