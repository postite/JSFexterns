package jsf;

extern class Global{

public static inline function alert(message:String):Void{

	untyped __js__("alert")(message);
}


/*Returns
True if OK is clicked, false if Cancel is clicked.

Description
Displays a string in a modal alert box, along with OK and Cancel buttons.*/
public static function confirm(message:String):Bool;
/*Arguments
caption A string containing the title of the dialog box.
text A string containing the prompt for the user.
Returns
The string entered if OK is clicked, null if Cancel is clicked.

Description
Prompts the user (with the string that is specified by text) to enter a string in a modal dialog box; the dialog box is titled with the string that is specified by caption.*/
public static function prompt(caption:String, text:String):Null<String>;
/*Arguments
arg1, arg2, ..., argN Strings containing content for output.
Returns
An output file.

Description
Same as WRITE_HTML; WRITE_HTML was created to let you differentiate HTML output calls from other JavaScript calls in your code.*/
public static function write(arg1:String, arg2:String /*..., argN*/):String; /// shall be called with untyped
/*Returns
An output file.

Description
Available only when exporting. Writes the CSS as an external file.*/
public static var  WRITE_CSS:String;

/*Arguments
arg1, arg2, ..., argN Strings containing content for output.
Returns
An output file.

Description
Available only when exporting. Converts each argument to a string and writes it to the HTML output file. To enter an end-of-line character, use “\n”; this is converted to the correct line ending for your platform. For more information, see HTML export objects.*/
public static function WRITE_HTML(arg1:String, arg2:String /*..., argN*/):String;

/// move that !
//public static function fw.setUseAGMRenderingForSelection()
}