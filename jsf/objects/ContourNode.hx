package jsf.objects;
import jsf.Point;

typedef ContourNode={
	var dynamicInfo:Array<ContourNodeDynamicInfo>; /* Array of ContourNodeDynamicInfo objects
on this ContourNode object (for more information, see ContourNodeDynamicInfo object).*/ 
var isCurvePoint:Bool; /* If set to true, this point’s
control points are constrained to be linear with the main point,
which forces a smooth curve. If set to false, there
are no constraints on the control points.*/ 
var isSelectedPoint:Bool; /* If set to true, this point
was subselected (for example, by the subselection tool).*/ 
var name:String; /* A unique name assigned to the object.*/ 
var predX:Float; /* The x coordinate of the contour node’s preceding
control point.*/ 
var predY:Float; /* The y coordinate of the contour node’s preceding
control point.*/ 
var randomSeed:Int; /* 0 to 65,535*/ 
var succX:Float; /* The x coordinate of the contour node’s following
control point.*/ 
var succY:Float; /* The y coordinate of the contour node’s following
control point.*/ 
var x:Float; /* The x coordinate of the contour node’s main
control point.*/ 
var y:Float; /* The y coordinate of the contour node’s main
control point.*/ 


public function  RegisterMove(registerMoveParms:RegisterMoveParms):Void; /* The RegisterMoveParms object containing
the move parameters. Use smartShape.GetDefaultMoveParms() to
obtain this object, then adjust properties as needed. For a list
of properties, see RegisterMoveParms object.*/ 
public function  RegisterLinearMove(p:Point,o:RegisterMoveParms):Void; /* A point, which in combination with the node
point, defines the line to move along.*/ 
public function  RegisterCircularMove(p:Point,o:RegisterMoveParms):Void; /* The center point for the circular movement.*/ 
public function  RegisterPolygonMove(p:Point,o:RegisterMoveParms):Void; /* The center point for the polygon.*/ 
}