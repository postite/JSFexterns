//export Options Object
//http://help.adobe.com/en_US/fireworks/cs/extend/WS5b3ccc516d4fbf351e63e3d1183c94988d-7fd4.html

/*

Note: When this object is used to set properties, the only required property is exportFormat. If other properties are not specified, their default values are used.
Use the following information to understand the rules for determining scaling in this object:

If useScale is set to true (the default), percentScale is used to uniformly scale the object on export, and applyScale is ignored.
If useScale is set to false and applyScale is set to false (the default), no scaling is performed on the object when it is exported.
If useScale is set to false and applyScale is set to true, then xSize and ySize determine scaling as follows:
– If the value is positive, specifies the exact size for the axis.
– If the value is zero, specifies that the axis public varies without limit.
– If the value is negative, specifies that the axis public varies but can be no larger than “abs(value)“
If one value is positive and one is negative, the positive value is always used. This gives the following possibilities:
– xSize < 0, ySize < 0 – use min(xSize, ySize) scaling
– xSize < 0, ySize = 0 – use xSize scaling
– xSize < 0, ySize > 0 – use ySize scaling
– xSize = 0, ySize < 0 – use ySize scaling
– xSize = 0, ySize = 0 – illegal; use scale of 1.0
– xSize = 0, ySize > 0 – use ySize scaling
– xSize > 0, ySize < 0 – use xSize scaling
– xSize > 0, ySize = 0 – use xSize scaling
– xSize > 0, ySize > 0 – do not use; instead, use useScale = true and percentScale = 0 to 100
The following table lists the properties of the ExportOptions object, along with their data types and, where appropriate, acceptable values and notes.
*/

package jsf;
import Fw.HexColor;
typedef ExportFrameInfo=Dynamic
typedef ExportPaletteInfo=Dynamic

extern class ExportOptions{

public var animAutoCrop:Bool; /* The default value is true.*/ 
public var animAutoDifference:Bool; /* The default value is true.*/ 
public var applyScale:Bool; /* The default value is true.*/ 
public var colorMode:String; /* Acceptable values are "indexed" (the
default), "24 bit", and "32 bit".*/ 
public var crop:Bool; /* The default value is false.*/ 
public var cropBottom:Int; /* The default value is 0.*/ 
public var cropLeft:Int; /* The default value is 0.*/ 
public var cropRight:Int; /* The default value is 0.*/ 
public var cropTop:Int; /* The default value is 0.*/ 
public var ditherMode:String; /* Acceptable values are "none" (the
default), "diffusion", and "2 by 2".*/ 
public var ditherPercent:Int; /* 0 to 100; default value is 100.*/ 
public var exportFormat:String; /* Acceptable values are "GIF", "JPEG", "PNG", "custom", and "GIF animation".
There is no default; this value must be specified.*/ 
public var frameInfo:Array<ExportFrameInfo>; /* Array of ExportFrameInfo objects (for more
information, see ExportFrameInfo object); can be null (the default). */ 
public var interlacedGIF:Bool; /* The default value is false.*/ 
public var jpegQuality:Int; /* 1 to 100; the default value is 80.*/ 
public var jpegSmoothness:Int; /* 0 to 8; the default value is 0.*/ 
public var jpegSubsampling:Int; /* 0 to 4; the default value is 1.*/ 
public var localAdaptive:Bool; /* The default value is true.*/ 
public var lossyGifAmount:Int; /* 0 to 100; the default value is 0.*/ 
public var macFileCreator:String; /* The default value is "" (an
empty String).*/ 
public var macFileType:String; /* The default value is ""(an
empty String).*/ 
public var name:String; /* The default value is "" (an
empty String).*/ 
public var numCustomEntries:Int; /* 0 to 256; default value is 0.*/ 
public var numEntriesRequested:Int; /* 0 to 256; default value is 128.*/ 
public var numGridEntries:Int; /* 0 to 256; default value is 6.*/ 
public var optimized:Bool; /* Default value is true.*/ 
public var paletteEntries:Array<HexColor>; /* Array of color Strings (for more information,
see Color String data type); default value is null.*/ 
public var paletteInfo:Array<ExportPaletteInfo>; /* Array of ExportPaletteInfo objects, or null if
all entries in the Array are default values (for more information,
see ExportPaletteInfo object); default value is null.*/ 
public var paletteMode:String; /* Acceptable values are "adaptive" (the
default), "custom", "grid", "monochrome", "Macintosh", "Windows", "exact",
and "Web 216".*/ 
public var paletteTransparencyType:String; /* Acceptable values are "none" (the
default), "index", "index alpha",
and "rgba".*/ 
public var percentScale:Int; /* 1 to 100,000; default value is 100.*/ 
public var progressiveJPEG:Bool; /* The default value is false.*/ 
public var savedAnimationRepeat:Int; /* The default value is 0.*/ 
public var sorting:String; /* Acceptable values are "none" (the
default), "luminance", and "popularity".*/ 
public var transparencyIndex:Int; /* -1 to 255; pass -1 to use
the background color’s index; default value is -1. */ 
public var useScale:Bool; /* The default value is true.*/ 
public var webSnapAdaptive:Bool; /* The default value is true.*/ 
public var webSnapTolerance:Int; /* The default value is 14.*/ 
public var xSize:Int; /* -100,000 to 100,000; default value is 0.*/ 
public var ySize:Int; /* -100,000 to 100,000; default value is 0.*/ 

}