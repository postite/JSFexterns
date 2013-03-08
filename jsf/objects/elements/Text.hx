package jsf.objects.elements;
import jsf.objects.PathAttrs;
import jsf.Point;
import jsf.objects.TextRuns;
extern class Text extends Element 
{
var antiAliased:Bool; /* If set to true (the default),
anti-aliases the text.*/ 
var antiAliasMode:String; /* Acceptable values are "smooth", "crisp",
and "strong". This value is ignored if the antiAliased property
is set to false.*/ 
var autoExpand:Bool; /* If set to true, the bounding
box will expand automatically to fit a line of text to prevent word
wrapping.*/ 
var autoKern:Bool; /* If set to true, uses pair-kerning
information in the fonts to kern the text. If set to false,
pair-kerning information in the fonts is ignored. Default value
is true.*/ 
var orientation:String; /* Acceptable values are "horizontal left to right" (the default), "vertical right to left", "horizontal right to left",
and "vertical left to right".*/ 
var pathAttributes:PathAttrs; /* PathAttrs object (for more information,
see PathAttrs object).*/ 
var randSeed:Float; /* A 32-bit integer. JavaScript integers hold
only 31-bit numbers, so it is stored as a Floating-point number.*/ 
var textRuns:TextRuns; /* TextRuns object (for more information, see TextRuns object).*/ 
var textChars:String; /* A String containing the text characters.*/ 
var textureOffset:Point; /* If the text has a textured brush or fill,
specifies the offset of the texture’s origin. */ 
var transformMode:String; /* Acceptable values are "paths" and "pixels".*/ 

// var rawTop:Float;  Top space occupied by the pixels (not the
// top location of the bounding box).  >commented because of redifinition



// var rawLeft:Float;  Leftmost space occupied by the pixels (not
// the left location of the bounding box). >commented because of redifinition

var rawWidth:Float; /* Width of the area occupied by the pixels
(not the area of the bounding box).*/ 
var rawHeight:Float; /* Height of the area occupied by the pixels
(not the area of the bounding box).*/ 




/// not in the doc but exists
 var fontsize:Int;
 var font:String;
// var alignment:String;//left,right,center etc..
// var bold:Bool;
// var underline:Bool;
// var italic:Bool;
// var fillColor:String;//hexa
// var leadingMode:String;//percentage , extact..
// var leading:Float;//line-height
 var hasLink:Bool;
 var urlText:String;
}
