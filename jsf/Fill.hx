package jsf;


typedef Pattern={
	var name:String; /* The name that appears in the Fill panel.*/ 
}

typedef Fill={

	var category:String; /* Specifies where this fill appears in the
Fill panel.*/ 
var ditherColors:Array<jsf.Fw.HexColor>; /* Array of two color Strings (see Color String data type).*/ 
var edgeType:String; /* Acceptable values are "hard" and "antialiased".*/ 
var feather:Int; /* 0 to 1000, which represents the feathering
value in pixels (0 means no feathering).*/ 
var gradient:jsf.Gradient; /* Gradient object (see Gradient object).*/ 
var name:String; /* The name that appears in the Fill panel.*/ 
var pattern:jsf.Pattern; /* Pattern object (see Pattern object).*/ 
var shape:String; /* Acceptable values are "solid", "linear", "radial", "conical", "satin", "pinch", "folds", "elliptical", "rectangular", "bars", "ripple", "waves", "pattern", and "web dither".*/ 
var stampingMode:String; /* Acceptable values are "blend" and "blend opaque".*/ 
var textureBlend:Float; /* 0 to 100*/ 
var webDitherTransparent:Bool; /* If set to true (and shape is
set to "web dither"), then the second color in
the ditherColors array is ignored and transparent
is used instead. */ 
	
}