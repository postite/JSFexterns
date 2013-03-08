package jsf.objects;
import jsf.Rectangle;
import jsf.objects.PathAttrs;

extern class RectanglePrimitive{
	

var roundness:Float; /* A floating-point value between 0 and 1 that
specifies the “roundness” to use for the corners (0 is
no roundness, 1 is 100% roundness).*/
var originalSides:Rectangle; /* A rectangle that specifies the original
sides of the primitive (see Rectangle data type). Because rectangle primitives remember transformations,
the user might see something different from the original sides. */
var mode:String; /* Specifies the roundness units, which can
be relative (percentage) or exact (pixels).*/
var transform:Matrix; /* A matrix that indicates all the transformations
that were applied to the primitive (see Matrix data type).*/
var pathAttributes:PathAttrs; /* A PathAttrs object that indicates the path
attributes of the primitive (see PathAttrs object).*/ 
}