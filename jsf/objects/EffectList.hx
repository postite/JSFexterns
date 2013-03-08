package jsf.objects;

typedef Effect=Dynamic //TODO

typedef EffectList = {

	var category:String; /* Specifies which subheading in the Effects
panel to use.*/ 
var effects:Array<Effect>; /* Array of Effect objects (for more information,
see Effect object).*/ 
var name:String; /* The name that appears in the Effects panel.*/ 

}