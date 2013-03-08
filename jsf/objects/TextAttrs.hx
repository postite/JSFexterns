package jsf.objects;


typedef TextAttrs={
var alignment:String; /* Acceptable values are "left", "center", "right", "justify",
and "stretch".*/ 
var baselineShift:Int; /* The number of pixels above (positive numbers)
or below (negative numbers) the baseline by which the characters
are shifted.*/ 
var bold:Bool; /* Set to true for bold text, false for
normal text.*/ 
var face:String; /* The name of the font, such as Arial.*/ 
var fillColor:String; /* A color String that specifies the color
of the text (see Color String data type).*/ 
var horizontalScale:Float; /* The relative width of the characters.1.0
— normal width< 1 — thinner than normal> 1 —
wider than normal*/ 
var italic:Bool; /* Set to true for italic
text, false for normal text.*/ 
var kerning:Float; /* Also known as pair kerning, kerning specifies
the percentage of an em square by which to separate two characters,
in addition to the amount the font specifies. Applies to only one
pair or characters. To specify kerning for a range of text, use
the rangeKerning property.0 — normal kerning<
0 — move the two characters closer together> 0 — move
the two characters farther apart*/ 
var leading:Float; /* The spacing between two lines of text, measured
from baseline to baseline. Larger numbers place more space between
lines of text. Smaller numbers move the lines closer together. The
exact effect of this property number depends on the value of the leadingMode property.*/ 
var leadingMode:String; /* The only acceptable value is "percentage",
which specifies that the leading property is a
percentage of the text’s point size. A leading property
of 1.0 means 100 percent or single-spaced, 2.0 means
200 percent or double-spaced, and so on. */ 
var rangeKerning:Float; /* The same as the kerning property,
but applies to a range of text, not only two characters.*/ 
var size:String; /* String of the form "#pt",
where # is a numeric value.*/ 
var underline:Bool; /* Set to true for underlined
text, false for normal text.*/

}