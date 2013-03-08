package jsf.htmlexport;

typedef BehaviorsList=Dynamic //todo
typedef ImagemapList=Dynamic//TODO


typedef SliceInfo={
var altText :String; /* The alternate text description for this
slice.*/ 
var backgroundAttachment:String; /* Specifies if the background image is fixed
or scrolls with the rest of the page.*/ 
var backgroundHorizontalPosition:String; /* Horizontal position of the background image.
(Left, right, or center, numeric value)*/ 
var backgroundHorizontalPositionVal:long; /* Horizontal position value of the background
image if the argument is value.*/ 
var backgroundRepeat:String; /* Specifies if the background image repeats,
and if repeats in X, Y, Repeat (Both) and No Repeat.*/ 
var backgroundVerticalPosition:String; /* Vertical position of the background image.
(Left, right, or center, numeric value).*/ 
var backgroundVerticalPositionVal:long; /* Vertical position value of the background
image if the argument is value.*/ 
var behaviors :BehaviorsList; /* BehaviorsList object that contains the behaviors
for this slice (see BehaviorsList object).*/ 
var cellHeight :Int; /* Height of this table row, in pixels.*/ 
var cellWidth :Int; /* Width of this table column, in pixels.*/ 
var columnSpan:Int; /* Span of the column.*/ 
var downIndex :Int; /* The index for the frame of the down state
for button slices.*/ 
public function getFrameFileName (frameIndex:Int):String; /* Returns a String that is the filename for
the slice on the specified frame, without directory or extension
information. For example, when exporting a file base named Button, Slices[0][0].getFrameFileName(0) returns "Button_r1_c1".Generally
all slices that have images have a frame filename. For frames 1
and higher, only slices that are rollovers or that are targeted
by a swap image have names.*/ 
var hasAltText:Bool; /* Set to true if the slice
has an alternate text description.*/ 
var hasHref:Bool; /* Set to true if the slice
has a URL.*/ 
var hasHtmlText:Bool; /* Set to true if the cell
is a text-only slice.*/ 
var hasImage :Bool; /* Set to true if this cell
has an image. For text-only slices, this is set to false.*/ 
var hasImagemap :Bool; /* Set to true if there are
image map Hotspots in this image slice.*/ 
var hasTargetText :Bool; /* Set to true if the target
text is not empty.*/ 
var height :Int; /* Height of the image in pixels, including
row spans.*/ 
var href :String; /* The URL link for this slice, which is expressed
as file://URL.*/ 
var htmlText :String; /* Text for a text-only slice.*/ 
var imagemap :ImagemapList; /* ImagemapList object containing the image
map information for this slice (see ImagemapList object).*/ 
var imageSuffix :String; /* Extension for the image in this cell, including
a period (.); for example, ".gif".*/ 
var isBackground:Bool; /* Specifies whether the slice is background
image or foreground image. True = Background.*/ 
var isUndefined :Bool; /* Set to true if the slice
does not have a slice object drawn over it. If you draw two slices
that don’t cover your document, Fireworks automatically generates slices
to cover the rest of the document. These slices are undefined.*/ 
var left :Int; /* Left side of the cell in pixels. The left
starts at 0.*/ 
var nestedTableSlices :Slice; /* A Slices object that describes a nested
table occupying the current table cell (see Slices object). Set to null if the cell does not
contain a nested table. */ 
var rowSpan:Int; /* Span of the row.*/ 
public function setFrameFileName (frameIndex:Int):Void; /* Sets the filename for the slice on the specified
frame, without directory or extension information. You can stop
an image from being exported by setting its name to "" (an
empty String).*/ 
var skipCell :Bool; /* Set to true if this cell
in the table is covered by a previous row span or column span.*/ 
var tableAlign :String; /* The table alignment for the table in the
current cell.*/ 
var tableBorder :Int ; /* The table’s border width.*/ 
var tablePadding :Int ; /* The table’s padding value. */ 
var tableSpacing :Int ; /* The table’s spacing value. */ 
var tableTagText :String; /* Text that contains table tag info that does
not have a direct correlation in Fireworks.*/ 
var tableWidth :Int; /* Percentage width if the table in the current
cell has a percentage width.*/ 
var targetText :String; /* Target text for this image, if any.*/ 
var tdTagText:String; /* Text of the <td> HTML tag.*/ 
var top :Int; /* Top of the cell in pixels. The top starts
at 0.*/ 
var width :Int; /* Width of the image in pixels, including
column spans.*/
}