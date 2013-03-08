package jsf.objects;

import jsf.Point;

typedef RegisterMoveParms={
	
	var constrainAngles:Bool; /* Determines whether dragging the control
point constrains the angles to the minAngle and maxAngle values. */ 
var constrainRotateKey :String; /* Pass in the key that you want to use to
constrain the rotation. A value of "none" means
that rotation will not be constrained. A value of "shiftKey" means
that when the user holds downs the Shift key while dragging the
mouse, rotation will be constrained. The value can be one of the
following: "none", "shiftKey", "ctrlCmdKey", "altOptKey". Note:
these points are set with minAngle and maxAngle.*/ 
var constrainX:Float; /* The value to constrain the x coordinate.Note:
the method constrainXKey must be used with this method.*/ 
var constrainXKey:String; /* Pass in the key that you want to use to
constrain the x-coordinate value. A value of "none" means
that x will not be constrained. A value of "shiftKey" means
that when the user holds downs the Shift key while dragging the
mouse, x will be constrained. The value can be one of the
following: "none", "shiftKey", "ctrlCmdKey", "altOptKey".*/ 
var constrainY:Float ; /* The value to constrain the y coordinate.Note:
the method constrainYKey must be used with this method.*/ 
var constrainYKey:Float ; /* Pass in the key that you want to use to
constrain the y-coordinate value. A value of "none" means
that y will not be constrained. A value of "shiftKey" means
that when the user holds downs the Shift key while dragging the
mouse, the value of y will be constrained. The value can
be one of the following: "none", "shiftKey", "ctrlCmdKey", "altOptKey".*/ 
var constrain45Key:String; /* The key value that you want to use to constrain
movement to the nearest 45º increment. Can be one of the following: "none", "shiftKey", "ctrlCmdKey", "altOptKey". A
key value of "none" means dragging will not be
constrained, "shiftKey" (or other value) means
that when the user holds downs Shift key (or other value) while
dragging, movement will be constrained. */ 
var constrain90Key:String; /* The key value that you want to use to constrain
movement to the nearest 90º increment. Can be one of the following: "none", "shiftKey", "ctrlCmdKey", "altOptKey". A
key value of "none" means dragging will not be
constrained, "shiftKey" (or other key) means that
when the user holds downs the Shift key (or other key) while dragging,
movement will be constrained. */ 
var deltaLinearToLinear:Float; /* Determines the ratio of mouse movement to
point movement along the line. For example, a value of 1.0 means
that if the mouse moves 1 pixel, the point moves 1 pixel along the
line specified in the method RegisterLinearMove. */ 
var deltaRtoR :Float; /* Determines the mouse radius change relative
to the point radius change. For example, a value of 1.0 means
that as the mouse moves 1 pixel away from the center of the object,
the point also moves 1 pixel away from the center of the object. */ 
var deltaShortestSideToX:Float; /* The ratio of shortest mouse movement to
the movement of referenced point’s x coordinate.*/ 
var deltaShortestSideToY:Float; /* The ratio of shortest mouse movement to
the movement of referenced point’s y coordinate. */ 
var deltaLongestSideToX:Float; /* The ratio of longest mouse movement to the
movement of referenced point’s x coordinate. */ 
var deltaLongestSideToY:Float; /* The ratio of longest mouse movement to the
movement of referenced point’s y coordinate. */ 
var deltaXtoX:Float; /* The ratio of mouse movement to the movement
of the referenced point’s x coordinate. For example, 1.0 means
that when the mouse moves 1 pixel to the right, the referenced point
also moves 1 pixel to the right.*/ 
var deltaXtoY :Float; /* The ratio of mouse movement on the x-axis
to the movement of the referenced point’s y coordinate. For
example, 1.0 means that when the mouse moves 1
pixel to the left, the referenced point moves 1 pixel towards the
top of the document. */ 
var deltaYtoX:Float; /* The ratio of mouse movement on the y-axis
to the movement of the referenced point’s x coordinate. For
example, 1.0 means that when the mouse moves 1
pixel to the top of the document, the referenced point moves 1 pixel
to the left. */ 
var deltaYtoY :Float; /* The ratio of mouse movement to the movement
of the referenced point’s y coordinate. For example, 1.0 means
that when the mouse moves 1 pixel toward the bottom of the document, the
referenced point also moves 1 pixel toward the bottom of the document. */ 
var disableRotateKey :String; /* Pass in the key that you want to use to
disable rotating around the center. The value can be one of the
following: "none", "shiftKey", "ctrlCmdKey", "altOptKey".
A value of "none"  means rotation will not be constrained.
A value of "shiftKey" means that when the user
holds downs the Shift key while dragging the mouse, rotation is
not constrained. */ 
var incrementRadius :Float; /* Constant value that is added to the radius. */ 
var incrementX :Float; /* This amount is added to the x movement of
the mouse when calculating the total movement.*/ 
var incrementY:Float; /* This amount is added to the y movement of
the mouse when calculating the total movement.*/ 
var maxAngle :Point; /* The maximum angle that can be set.*/ 
var maxLinear :Float; /* Determines the maximum amount the point
can move along a line.*/ 
var maxRadius :Float; /* The maximum radius value.*/ 
var maxX:Float; /* The maximum value the x coordinate
can move.*/ 
var maxY:Float; /* The maximum value the y coordinate
can move.*/ 
var minAngle :Point; /* The minimum angle that can be set.*/ 
var minLinear:Float; /* The minimum amount the point can move along
a line.*/ 
var minMaxRelative:Bool; /* Determines whether the min and max values
are relative or absolute. For example, if max.x=100 and minMaxRelative is true,
then x can move up 100 points to the right. If minMaxRelative is
set to false then the maximum x can be set to is
100. */ 
var minX:Float; /* The minimum value the x coordinate can move.*/ 
var minY:Float; /* The minimum value the y coordinate can move.*/ 
var minRadius :Float; /* The minimum radius value.*/ 
var movePred:Bool; /* Determines whether the predecessor point
should be moved as the user moves the mouse.*/ 
var movePt :Bool; /* Determines whether the point itself should
be moved as the user moves the mouse.*/ 
var moveSucc :Bool; /* Determines whether the successor point should
be moved as the user moves the mouse. */ 
var rotate :Bool; /* Determines whether the point should rotate
along with the mouse rotation.*/ 
}