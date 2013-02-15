
package jsf.core;

@:native("Files")
extern class Files {
public static function copy(docname1:String, docname2:String):Bool; /* Copies the file specified in the first argument
to the file specified in the second argument. Each argument must
be the name of a file, which is expressed as file://URL.
Only files (not directories) can be copied. The files do not need
to reside on the same drive, and the method does not overwrite a
file if it already exists. Returns a value of true if
the copy is successful; false otherwise.*/ 
public static function createDirectory(dirname:String):Bool; /* Creates the specified directory. Returns true if
successful; false otherwise.*/ 
public static function createFile(fileURL:String, fileType:String, fileCreator:String):Void; /* Creates the specified file. The file must
not already exist. The first argument is the name of the file, which
is expressed as file://URL. The last two arguments let you
specify the file type and file creator Strings. The fileType and fileCreator Strings
should each be Strings of exactly four characters in length, for
example:Files.createFile(newFile,".txt","FWMX");*/ 
public static function deleteFile(docOrDir:String):Bool; /* Deletes the specified file or directory.
Returns true if successful; false if
the file or directory does not exist or cannot be deleted. Compare
with deleteFileIfExisting().*/ 
public static function deleteFileIfExisting(docOrDir:String):Bool; /* Deletes the specified file or directory.
Returns true if successful; false if
the file or directory cannot be deleted. Unlike deleteFile(),
this method returns true if the file or directory
does not exist.*/ 
public static function enumFiles(docOrDir:String):Array<String>; /* Returns an array of file URLs. If docOrDir is
a directory, the array contains an entry for every file or directory
that is contained in the specified directory. If docOrDir is
a file, the array contains a single entry (the file passed in).*/ 
public static function exists(docOrDir:String):Bool; /* Returns true if docOrDir refers
to a directory or file that exists; false otherwise. */ 
public static function getDirectory(docname:String):String; /* Returns only the directory name from docname,
which is expressed as file://URL. For example, Files.getDirectory("file://work/logo.png") returns "file:///work".*/ 
public static function getExtension(docname:String):String; /* Returns the filename extension, if any,
of docname. For example, Files.getExtension("birthday.png") returns ".png".
If the filename has no extension, an empty String is returned. A
filename that is expressed as file://URL is acceptable.*/ 
public static function getFilename(docname:String):String; /* Returns just the filename from docname,
which is expressed as file://URL. For example, Files.getFilename("file:///work/logo.png") returns "logo.png".*/ 
public static function getLanguageDirectory():String; /* Returns the URL of the language directory
associated with the currently running language.*/ 
public static function getLastErrorString():String; /* If the last call to a method in a Files
object resulted in an error, returns a String that describes the
error. If the last call succeeded, returns null.*/ 
public static function getTempFilePath(?dirname:String) :String; /* The argument, if used, must be expressed
as file://URL. Returns a file URL in the Temporary Files
directory or in the specified directory. This method does not create
a file; it simply returns a unique file URL that does not conflict
with existing files in the directory. If dirname is
passed and is not null, the URL that is returned
indicates a file in the specified directory rather than in the Temporary
Files directory.*/ 
public static function isDirectory(dirname:String):Bool; /* The argument must be expressed as file://URL.
Returns true if the specified URL refers to a directory
that exists; false otherwise. */ 
public static function makePathFromDirAndFile(dirname:String,plainFilename:String):String; /* The first argument must be expressed as file://URL.
Concatenates the two arguments to return a file URL that references
the specified filename in the specified directory. For example, Files.makePathFromDirAndFile("file:///work/reports", "logo.png") returns "file:///work/reports/logo.png".*/ 
public static function open(docname:String, encoding:String, bWrite:Bool):FileReference; /* The first argument must be expressed as file://URL.
Opens the specified file for reading or writing. The second argument
specifies the encoding. If the third argument is true,
the file opens for writing; otherwise it opens for reading. If the
file cannot be opened, returns null; otherwise,
returns a File Reference object.*/ 
public static function rename(docname:String,newPlainFilename:String):String; /* The docname argument
is a file path or a file URL to the file that you want to rename.The newPlainFilename argument
is the new name to assign to the file.The rename method
returns a URL path of the newly renamed file if successful; otherwise
Fireworks returns null.*/ 
public static function setFilename(docname :String, newPlainFilename:String):String; /* The first argument must be expressed as file://URL.
Returns a file URL withdocname replaced
by newPlainFilename. For example, Files.setFilename("file:///work/logo.png", "oldlogo.png") returns "file:///work/oldlogo.png". This
method does not affect the file on disk; it simply provides a convenient
way to manipulate file URLs. To change the name on disk, use rename().*/ 
public static function swap(docname1:String, docname2:String):Bool; /* Each argument must be expressed as a file://URL.
Swaps the contents of the two specified files, so that each file
contains the contents of the other file. Only files (not directories)
can be swapped, and both files must reside on the same drive. Returns true if
the swap is successful; false otherwise. */ 

}