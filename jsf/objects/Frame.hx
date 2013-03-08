package jsf.objects;








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