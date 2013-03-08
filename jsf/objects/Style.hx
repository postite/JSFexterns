package jsf.objects;

import jsf.objects.PathAttrs;

typedef Style = {

var effectList :object; /* EffectList object (see EffectList object).*/
var name :String; /* The name displayed in the Style panel.*/
var pathAttributes :PathAttrs; /* PathAttrs object (see PathAttrs object).*/
var tdTagText :String; /* A String that contains all the attributes
of a table cell except colspan and rowspan.
Should be in a format similar to the following: "bgcolor="ff0000" valign="top"" */
var textBold :Bool; /* Makes the specified text bold; used only
if use_textStyles is set to true. */
var textFont :String; /* The font to apply to text; used only if use_textFont is
set to true.*/
var textItalic :Bool; /* Makes the specified text italic; used only
if use_textStyles is set to true.*/
var textSize:String; /* String of the form "#pt",
where # is a numeric value.*/
var textUnderline:Bool; /* Underlines the specified text; used only
if use_textStyles is set to true.*/
var use_brush:Bool; /* If set to true, applies
the brush property of the PathAttrs object when
applying the style. If set to false, ignores the brush property.
The default value is false. */
var use_brushColor:Bool; /* If set to true, applies
the brushColor property of the PathAttrs object
when applying the style. If set to false, ignores
the brushColor property. The default value is false.*/
var use_effectList:Bool; /* If set to true, applies
the effects property of the EffectList object when
applying the style. If set to false, ignores the effects property.
The default value is false.*/
var use_fill:Bool; /* If set to true, applies
the fill property of the PathAttrs object when
applying the style. If set to false, ignores the fill property.
The default value is false.*/
var use_fillColor:Bool; /* If set to true, applies
the fillColor property of the PathAttrs object
when applying the style. If set to false, ignores
the fillColor property. The default value is false.*/
var use_textFont:Bool; /* If set to true, applies
the textFont property of the PathAttrs object when
applying the style. If set to false, ignores the textFont property.
The default value is false.*/
var use_textSize:Bool; /* If set to true, applies
the textSize property of the PathAttrs object when
applying the style. If set to false, ignores the textSize property.
The default value is false.*/
var use_textStyles:Bool; /* If set to true, applies
the textStyles property of the PathAttrs object
when applying the style. If set to false, ignores
the textStyles property. The default value is false.*/ 

}