//ExportSettings object
package jsf;


extern class ExportSettings{


public var baseName:String; /* The name from which all automatically named
slice names are derived.*/ 
public var discardUnspecifiedSlices:Bool; /* If set to true, omits undefined
slices from export operations.*/ 
public var docHtmlEncoding:String; /* Determines the encoding standard for the
HTML file that Fireworks generates during export. Use "iso-8859-1" for
ASCII or "utf-8" for Unicode.*/ 
public var docXHTMLFormat:Bool; /* Determines whether Fireworks outputs XHTML
formatted files (true) or HTML formatted files
(false) when the user exports a file.*/ 
public var exportFilesStyle:String; /* Acceptable values are: */ 
public var fileExtension:String; /* Defines the extension to append to the filename.*/ 
public var generateDemoHtml:Bool; /* If set to true, generates
multiple HTML pages for button export.*/ 
public var htmlDestination:String; /* Acceptable values are "same", "custom",
and "clipboard".*/ 
public var setByUser:Bool; /* If set to true, the user
specifies the export settings. If set to false,
the first time the file is exported, Fireworks chooses settings
based on the data.*/ 
public var shimGeneration:String; /* Acceptable values are "none" (no
shims), "transparent" (one-pixel transparent shims),
and "nested tables" (no shims, but nested tables).*/ 
public var sliceAlongGuides:Bool; /* If set to true, use guides
for slicing (and sliceUsingUrls should be set to false).*/ 
public var sliceAutoNaming1 :String; /* Used to generate a name by concatenating
six Strings. If you need fewer than six Strings, fill in the remaining
Strings with "none". Acceptable values are: "none" —
generates nothing."row_col" — generates
a unique row and column index; 0_0 is first, 0_1 is
second, and so on."ALPHA" — generates a
unique uppercase letter: A is first, B is second,
and so on."alpha" — generates a unique lowercase
letter: a is first, b is second,
and so on. "numeric1" — generates a unique
number: 1 is first, 2 is second,
and so on."numeric01" — generates a unique
two-digit number: 01 is first, 02 is
second, and so on."doc.name" — name of the
file being exported, without a path or extension, such as "image"."slice" —
the String "slice"."underscore" —
the underscore character (_)"period" — the
period character (.)"space" — the space
character ( )"hyphen" — the hyphen character
(-)For example, to generate names of "image_slice01", "image_slice02",
and so on from a document named "image", set the
following properties:sliceAutoNaming1: "doc.name"sliceAutoNaming2: "underscore"sliceAutoNaming3: "slice"sliceAutoNaming4: "numeric01" sliceAutoNaming5: "none" sliceAutoNaming6: "none"*/ 
public var sliceAutoNaming6:String; /* Used to generate a name by concatenating
six Strings. If you need fewer than six Strings, fill in the remaining
Strings with "none". Acceptable values are: "none" —
generates nothing."row_col" — generates
a unique row and column index; 0_0 is first, 0_1 is
second, and so on."ALPHA" — generates a
unique uppercase letter: A is first, B is second,
and so on."alpha" — generates a unique lowercase
letter: a is first, b is second,
and so on. "numeric1" — generates a unique
number: 1 is first, 2 is second,
and so on."numeric01" — generates a unique
two-digit number: 01 is first, 02 is
second, and so on."doc.name" — name of the
file being exported, without a path or extension, such as "image"."slice" —
the String "slice"."underscore" —
the underscore character (_)"period" — the
period character (.)"space" — the space
character ( )"hyphen" — the hyphen character
(-)For example, to generate names of "image_slice01", "image_slice02",
and so on from a document named "image", set the
following properties:sliceAutoNaming1: "doc.name"sliceAutoNaming2: "underscore"sliceAutoNaming3: "slice"sliceAutoNaming4: "numeric01" sliceAutoNaming5: "none" sliceAutoNaming6: "none"*/ 
public var sliceFrameNaming1:String; /* Used to generate a name by concatenating
two Strings; the resulting String is concatenated to the name specified
by sliceAutoNaming. If you need fewer than two
Strings, fill in the remaining String with "none". Acceptable
values are:"none" — generates nothing."frameNumber" —
generates frame number preceded by f, for example, f2."number" —
generates frame number, for example, 2."state" —
generates frame state, for example, "over", "down",
or "overdown"."abbreviation" —
generates abbreviated state, for example, "o", "d",
or "od“."underscore" —
the underscore character (_)"period" — the
period character (.)"space" — the space
character ( )"hyphen" — the hyphen character
(-)*/ 
public var sliceFrameNaming2:String; /* Used to generate a name by concatenating
two Strings; the resulting String is concatenated to the name specified
by sliceAutoNaming. If you need fewer than two
Strings, fill in the remaining String with "none". Acceptable
values are:"none" — generates nothing."frameNumber" —
generates frame number preceded by f, for example, f2."number" —
generates frame number, for example, 2."state" —
generates frame state, for example, "over", "down",
or "overdown"."abbreviation" —
generates abbreviated state, for example, "o", "d",
or "od“."underscore" —
the underscore character (_)"period" — the
period character (.)"space" — the space
character ( )"hyphen" — the hyphen character
(-)*/ 
public var sliceUsingUrls:Bool; /* If set to true, use slice
objects for slicing (and sliceAlongGuides should
be set to false).*/ 
public var templateName:String; /* HTML style to be used during export. Acceptable
values are "Dreamweaver", "Generic", "FrontPage", "GoLive",
or a user-created HTML style.*/ 



}