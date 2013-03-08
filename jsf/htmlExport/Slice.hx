package jsf.htmlexport;

typedef Slice={



	var demoIndex:Int; /* Index for each file generated for multiple
file button export.*/ 
var doDemoHTML:Bool; /* Corresponds to the Export Multiple Nav bar
HTML Files check box in the Document Specific tab of the HTML Setup
dialog box. Setting this property to true produces
n+1 HTML pages where n is the number of buttons. A value of false produces a
single HTML page.*/ 
var doShimEdges:Bool; /* Set to true if table shims
are set to Transparent Image in Document properties.*/ 
var doShimInternal:Bool; /* Specifies if the shim mode is internal.*/ 
var doSkipUndefined:Bool; /* Set to true if Export Undefined
Slices is not selected in Document Properties.*/ 
var id:Int; /* Slice ID.*/ 
var imagesDirPath:String; /* Relative URL to the images folder. For example, "images/", or "../site_images",
or "" (an empty String) if the images and the HTML
are in the same directory.*/ 
var layerName:String; /* Name of the layer.*/ 
var menuArrowPath:String; /* Relative URL to the shim GIF file, arrows.gif.*/ 
var menuPath:String; /* Relative URL of the menu.*/ 
var numColumns:Int; /* Number of columns in the HTML table. Does
not include the shim column.*/ 
var numRows:Int; /* Number of rows in the HTML table. Does not
include the shim row.*/ 
var shimPath:String; /* Relative URL to the shim GIF file; for example, "images/shim.gif".*/ 
var tableNested:Bool; /* Specifies if the table is nested.*/ 
var width:String; /* Specifies the slice width.*/ 
}