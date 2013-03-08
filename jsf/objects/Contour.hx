package jsf.objects;



typedef Contour={
	var isClosed:Bool; /* If set to true, the path
is closed by connecting the final point in the contour with the
first point.*/ 
var nodes:Array<ContourNode>; /* Array of ContourNode objects on the contour
(for more information, see ContourNode object).*/ 	
}