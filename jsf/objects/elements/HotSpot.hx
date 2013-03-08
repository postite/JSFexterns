package jsf.objects.elements;

extern class HotSpot extends Element{


var altText:String; /* Text that is written into the HTML Alt tag
when exporting.*/ 
var behaviors:Array<Behaviour>; /* Array of Behavior objects for the Hotspot
(for more information, see Behavior object).*/ 
var color:String; /* Color in which the Hotspot is drawn in the
Document window. Default value is "#00FFFF".*/ 
var contour:Contour; /* Contour object for the Hotspot (for more
information, see Contour object). Used only if shape="polyline";
otherwise null.*/ 
var shape:String; /* Acceptable values are "rectangle", "circle",
and "polyline".*/ 
var targetText:String; /* Text that is written into the HTML Target tag
when exporting.*/ 
var urlText:String; /* Text that is written into the HTML Href tag
when exporting.*/
	
}