
package jsf ;

extern class SliceHotSpot extends Element {

var baseName:String; /* Base name for slice filenames, or null for
automatic name.*/ 
var exportOptions:ExportOptions; /* ExportOptions object (for more information,
see ExportOptions object); null if using current document
defaults.*/ 
var htmlText:String; /* If sliceKind is set to "empty",
this text is exported instead of the image. The default is an empty
String.*/ 
var sliceID :String; /* An arbitrary String that uniquely identifies
this slice.*/ 
var sliceKind:String; /* If set to "image", generates
an image; if set to "empty", generates the text
specified by htmlText.*/ 
var tdTagText:String; /* This String contains all the attributes
of a table cell except the colspan and rowspan values.An
example value is "bgcolor=ff0000" valign="top".*/

}