package jsf.objects;

import jsf.objects.Brush;
import jsf.objects.elements.Texture;
import jsf.objects.Fill;

typedef PathAttrs = {

	var brush:Brush; /* Brush object (see Brush object).*/ 
var brushColor:String; /* A color String that specifies the color
that is used for rendering the Brush object, if any (see Color String data type). */ 
var brushPlacement:String; /* Acceptable values are "inside", "center",
and "outside".*/ 
var brushTexture:Texture; /* Texture object (see Texture object).*/ 
var fill:Fill; /* Fill object (see Fill object).*/ 
var fillColor:String; /* A color String that specifies the color
used for rendering the Fill object, if any (see Color String data type).*/ 
var fillHandle1:Point; /* The three fillHandle properties
are used by Gradient and Pattern fills to set the angle and size
of the gradient/pattern.*/ 
var fillHandle2:Point; /* */ 
var fillHandle3:Point; /* */ 
var fillOnTop:Bool; /* If set to true, the fill
is drawn on top of the brush; if set to false (the
default), the fill is drawn beneath the brush.*/ 
var fillTexture:Texture; /* Texture object (see Texture object).*/ 

}