package jsf.objects;
import jsf.objects.TextAttrs;
import jsf.objects.SingleTextRun;

typedef TextRuns={
	
	var initialAttrs:TextAttrs; /* TextAttrs object (see TextAttrs object).*/ 
	var textRuns:Array<SingleTextRun>; /* Array of SingleTextRun objects on this TextRuns
object (see SingleTextRun object).*/
}