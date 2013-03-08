package jsf.objects;

typedef Behaviour={
	var call:String; /* The JavaScript call for the behavior. For
						legal values, see Using the dom.addBehavior() function.*/ 
						
	var event:String; /* Acceptable values are "onMouseOver", "onClick", "onMouseOut", "onLoad",
						and "**ANY**" (the **ANY** argument
						is used as a wildcard value in some situations).*/ 
}