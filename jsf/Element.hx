
package jsf;

typedef EffectList=Dynamic
typedef ElementMask=Dynamic
typedef Struct=Dynamic



/*
Element is an abstract or base class; nothing of class Element ever exists. However, it is useful for simplifying the other class descriptions. Read-only properties are marked with a bullet (•).*/
typedef Element = {

var blendMode:String; /* Acceptable values are "normal", "multiply", "screen", "darken", "lighten", "difference", "hue", "saturation", "color", "luminosity", "invert", "tint",
and "erase".*/ 
var customData:Struct; /* Assign any objects (array, integer, String,
and so on).*/ 
var effectList:EffectList; /* EffectList object (for more information,
see EffectList object).*/ 
var height :Float; /* Read-only in the base class; other properties
or API calls are used to resize specific types of elements.*/ 
var isLayer:Bool; /* Always false for an element.*/ 
var isSmartShape :Bool; /* Confirms whether the element is an Auto
Shape.*/ 
var left:Float; /* Can round to an integer.*/ 
var mask:ElementMask; /* ElementMask object (for more information,
see ElementMask object).
Returns null if the element has no element mask.*/ 
var name:String; /* Can be null (removes any
existing name).*/ 
var opacity:Float; /* Acceptable values, 0 to 100, represent percent
opacity.*/ 
var rawLeft:Float; /* Leftmost space occupied by the pixels (not
the left location of the bounding box).*/ 
var rawTop:Float; /* Top space occupied by the pixels (not the
top location of the bounding box).>*/ 
var top:Float; /* Can round to an integer.*/ 
var pixelRect:jsf.Rectangle; /* Rectangle of the area occupied by the pixels.
For example, the pixelRect of a text object is smaller than what
the property inspector reports, since the actual pixels are inside
the bounding box.*/ 
var visible:Bool; /* If set to false, the element
is hidden. The default value is true.*/ 
var width :Float; /* Read-only in the base class; other properties
or API calls are used to resize specific types of elements.*/ 
var generateSmartShapeCode:String; /* The root parameter is a String value that
is prefixed to each line of output.*/ 

}