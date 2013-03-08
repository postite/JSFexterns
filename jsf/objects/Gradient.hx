package jsf.objects;

typedef GradientNode={
var color:String; /* A color string that specifies the color
at this position in the gradient (see Color string data type).*/ 
var isOpacityNode:Bool; /* If set to true, this node
is part of the gradient’s opacity ramp.*/ 
var position:Float; /* 0.0 to 1.0*/ 

}
typedef Gradient={

	var name:String; /* The name that appears in the Fill panel. */ 
var nodes:Array<GradientNode>; /* Array of GradientNode objects (see GradientNode object).*/ 
var opacityNodes:Array<GradientNode>; /* Array of GradientNode objects (see GradientNode object), that identify the opacity ramp associated with a
gradient.*/
	
}