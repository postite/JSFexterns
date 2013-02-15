
package jsf.core;

typedef FileReference = {

public function close():Void; /* Closes the current File Reference object.
You are not required to use this method (the file is closed when
the Files object is destroyed), but it is useful for controlling
access to a file.*/
public function readline():String; /* Reads the next line from the current File
Reference object and returns it as a string. The end-of-line character(s)
are not included in the string. Returns null if
end-of-file is reached or if the line is longer than 2048 characters.*/
public function readLineUTF8():String; /* Reads one line from the file that has been
opened with UTF8 encoding.*/
public function write(textString:String):Void; /* Writes
the specified string to the current File Reference object. No end-of-line
characters are appended; to include one, use "\n".*/
public function writeUTF8(textString:String):Void; /* Writes text in UTF8 encoding when the file
is opened in UTF8 encoding. */

}