
package jsf;

typedef PathAttrs = {

	var brush:jsf.Brush; /* Brush object (see Brush object).*/ 
var brushColor:String; /* A color String that specifies the color
that is used for rendering the Brush object, if any (see Color String data type). */ 
var brushPlacement:String; /* Acceptable values are "inside", "center",
and "outside".*/ 
var brushTexture:jsf.Document.Texture; /* Texture object (see Texture object).*/ 
var fill:jsf.Fill; /* Fill object (see Fill object).*/ 
var fillColor:String; /* A color String that specifies the color
used for rendering the Fill object, if any (see Color String data type).*/ 
var fillHandle1:jsf.Fw.Point; /* The three fillHandle properties
are used by Gradient and Pattern fills to set the angle and size
of the gradient/pattern.*/ 
var fillHandle2:jsf.Fw.Point; /* */ 
var fillHandle3:jsf.Fw.Point; /* */ 
var fillOnTop:Bool; /* If set to true, the fill
is drawn on top of the brush; if set to false (the
default), the fill is drawn beneath the brush.*/ 
var fillTexture:jsf.Document.Texture; /* Texture object (see Texture object).*/ 

}