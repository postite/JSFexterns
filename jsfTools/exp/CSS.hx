package jsfTools.exp;

import jsf.objects.elements.Text;
import jsf.Fw;
using Reflect;

class CSS 
{
	public function new()
	{
		
	}
	// Text
// extract font attribue from text object and produce css code
	public static function cssFromTextObject(text:Text):String
	{
    var css="";

  // JS_DATA("obj['bold'] = "+o.textRuns.initialAttrs.bold+";");
	
	    var font = Fw.getPlatformNameForPSFont(text.font); 

	   // var fontsize = obj.field("fontsize");//*10
	    var fontsize = text.fontsize;

	    var alignment = text.textRuns.initialAttrs.alignment;
	    var bold= text.textRuns.initialAttrs.bold;
	    var underline= text.textRuns.initialAttrs.underline;
	    var italic=text.textRuns.initialAttrs.italic;


	    //return css;
	   css= css+ Std.format('font-family:$font;font-size:${fontsize}px;');
	//     css  = css + "font-family: "+mapFontFamily(font).replace(/ - /g, ", ")+";font-size: "+fontsize+"%;";
	
	// 	if(abort)
	// 		return;
		

		trace(Std.format("italic=$italic font=$font fontsize=$fontsize alignment=$alignment bold=$bold underline=$underline haslink=${text.hasLink}"));
	   // if(italic || (fw.getStyleNameForPSFont(obj["font"]).search(/Italic/i)!= -1))
		
		if( italic)

		css = css + "font-style: italic;";

	//         css = css + "font-style: italic;";
	//     if(bold || (fw.getStyleNameForPSFont(obj["font"]).search(/Bold/i)!= -1))
		if( bold)
	         css = css + "font-weight: bold;";
	 	css = css + "text-align: "+alignment+";";
	 	if(underline)
	 	{
	        css = css + "text-decoration: underline;"; 
	     }else if(text.hasLink && text.urlText!=null)
	    {
	 		css = css + "text-decoration: none;"; 
	 	}
	    trace("after underline");
	    if(text.textRuns.initialAttrs.fillColor!=null)
	        css = css + "color: "+CONVERT_COLOUR(text.textRuns.initialAttrs.fillColor)+";";
	       
	     // line height
	     if(text.textRuns.initialAttrs.leadingMode == "percentage")
	    {
	       var leading:Float = text.textRuns.initialAttrs.leading * 100;
	       css = css + "line-height: "+(Math.round(leading*100)/100)+"%;";
	        
	    }else if(text.textRuns.initialAttrs.leadingMode == "exact")
	     {
	         var leading = text.textRuns.initialAttrs.leading;
	         css = css + "line-height: "+leading+"px;";
	     }


	//     // apply padding to match how FW looks
	 	
	 	
	 	css = css + "padding-top:1px;";
	 	css = css + "padding-bottom:2px;";
	 	
    
    return css;
}


public static  function CONVERT_COLOUR(col:jsf.Fw.HexColor) {
	var colour = col.toLowerCase();
	var colour = StringTools.replace(colour,"#","");
	if ((colour.charAt(0) == colour.charAt(1)) && (colour.charAt(2) == colour.charAt(3)) && (colour.charAt(4) == colour.charAt(5))) {
		var colourTemp = colour.charAt(0);
		colourTemp += colour.charAt(2);
		colourTemp += colour.charAt(4);
		colour = colourTemp;
	}
	colour = "#" + colour;
	return colour;
}
}