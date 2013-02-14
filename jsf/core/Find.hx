/// not the way it shoul be

package jsf.core;

typedef Find={


////////////Finding and replacing text//////////////
var whatToFind:String; /* In the format: "text"*/
var find:String; /* Text to find.*/
var matchCase:Bool; /* If set to true, the search
is case-sensitive. Defaults to false.*/
var numItemsReplaced:Int; /* Number of replacements done in a file using
Find and Replace.*/
var regExp:Bool; /* If set to true, the find
and replace text is interpreted as a regular expression. The default
is false.*/
var replace:String; /* Text to use as replacement text.*/
var wholeWord:Bool; /* If set to true, only whole
words matching the search text are found. The default is false.*/


}

typedef FindFont={

var whatToFind:String; /* In the format: "font"*/ 
var find:String; /* Name of font to find.*/ 
var replace:String; /* Name of font to use as replacement.*/ 
var findStyle:Int; /* Number that represents the style to find:AnyStyle = -1Plain = 0Bold = 1Italic = 2BoldItalic = 3Underline = 4BoldUnderline = 5ItalicUnderline = 6BoldItalicUnderline = 7*/ 
var replaceStyle:Int; /* Number that represents the style to be used
as replacement.*/ 
var findMinSize:Int; /* 0 to 9999*/ 
var findMaxSize:Int; /* 0 to 9999*/ 
var replaceSize:Int; /* 0 to 9999, or pass -1 to
leave size as is*/ 

}

typedef FindGraphics={

var whatToFind:String; /* In the format: "color"*/ 
var find:String; /* A color String that specifies the color
to find (for more information, see Color String data type).*/ 
var replace:String; /* A color String that specifies the color
to use as a replacement (for more information, see Color String data type).*/ 
var fills:Bool; /* If set to true, fills that
match the specified colors are replaced.*/ 
var strokes:Bool; /* If set to true, strokes
that match the specified colors are replaced.*/ 
var effects:Bool; /* If set to true, effects
that match the specified colors are replaced.*/ 
}

typedef FindUrl={
	var whatToFind:String; /* In the format: "url"*/ 
var find:String; /* URL to find, which is expressed as file://URL.*/ 
var replace:String; /* URL to use as replacement text, which is
expressed as file://URL.*/ 
var wholeWord:Bool; /* If set to true, only whole
words that match the search text are found. The default is false.*/ 
var matchCase:Bool; /* If set to true, the search
is case sensitive. Defaults to false.*/ 
var regExp:Bool; /* If set to true, the find and replace text
is interpreted as a regular expression. The default value is false.*/ 
}

typedef FindNonWebColor={
	var whatToFind:String; /* In the format: "nonwebcolor"*/ 
var effects:Bool; /* If set to true, colors
in effects are replaced. The default value is false.*/ 
var fills:Bool; /* If set to true, colors
in fills are replaced. The default value is false.*/ 
var strokes:Bool; /* If set to true, colors
in strokes are replaced. The default value is false.*/ 
}