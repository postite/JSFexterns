package jsf;

typedef Brush={


	var alphaRemap:String; /* Acceptable values are "none", "white neon", "harsh wet", "smooth neon", "wavy gravy",
and "white neon edge".*/ 
var angle:Int; /* 0 to 360*/ 
var antiAliased:Bool; /* If set to true, the brush
edges are anti‑aliased.*/ 
var aspect:Float; /* 0 to 100*/ 
var blackness:Float; /* 0 to 100*/ 
var category:String; /* Determines in which subsection of the Stroke
panel the brush will appear (for example, Pencil, Airbrush, and
so on).*/ 
var concentration:Float; /* 0 to 100*/ 
var dashOffSize1:Int;
var dashOffSize2:Int;
var dashOffSize3:Int; /* The lengths in pixels of spaces for a dotted
line, these values control the first, second, and third spaces,
respectively.*/ 
var dashOnSize1:Int;
var  dashOnSize2:Int; 
var dashOnSize3:Int; /* The lengths, in pixels, of dashes for a
dotted line, these values control the first, second, and third dashes,
respectively.*/ 
var diameter:Int; /* 0 to 1000*/ 
var feedback:String; /* Acceptable values are "none", "brush",
and "background".*/ 
var flowRate:Float; /* 0 to 100*/ 
var maxCount:Int; /* 0 to 64*/ 
var minSize:Float; /* 0 to 100*/ 
var name:String; /* The name of the brush, which is visible
in the Stroke panel.*/ 
var numDashes:Int; /* 0 to 3*/ 
var sense_hdir_angle:Float; /* The sense* properties map
directly to the values on the Stroke Options > Advanced dialog
> Sensitivity tab (accessible through the Brush property inspector
stroke settings); where hdir is the horizontal
value and vdir is the vertical value, and blackness is
the build-up of black pixels as some tools brush over the same spot
repeatedly (like the felt tip).*/ 
var sense_hdir_blackness:Float; /* */ 
var sense_hdir_hue:Float; /* */ 
var sense_hdir_lightness:Float; /* */ 
var sense_hdir_opacity:Float; /*  */ 
var sense_hdir_saturation:Float; /*  */ 
var sense_hdir_scatter:Float; /*  */ 
var sense_hdir_size:Float; /*  */ 
var sense_pressure_angle:Float; /*  */ 
var sense_pressure_blackness:Float; /*  */ 
var sense_pressure_hue:Float; /*  */ 
var sense_pressure_lightness:Float; /*  */ 
var sense_pressure_opacity:Float; /*  */ 
var sense_pressure_saturation:Float; /*  */ 
var sense_pressure_scatter:Float; /*  */ 
var sense_pressure_size:Float; /*  */ 
var sense_random_angle:Float; /*  */ 
var sense_random_blackness:Float; /*  */ 
var sense_random_hue:Float; /*  */ 
var sense_random_lightness:Float; /*  */ 
var sense_random_opacity:Float; /*  */ 
var sense_random_saturation:Float; /*  */ 
var sense_random_scatter:Float; /*  */ 
var sense_random_size:Float; /*  */ 
var sense_speed_angle:Float; /*  */ 
var sense_speed_blackness:Float; /*  */ 
var sense_speed_hue:Float; /*  */ 
var sense_speed_lightness:Float; /*  */ 
var sense_speed_opacity:Float; /*  */ 
var sense_speed_saturation:Float; /*  */ 
var sense_speed_scatter:Float; /*  */ 
var sense_speed_size:Float; /*  */ 
var sense_vdir_angle:Float; /*  */ 
var sense_vdir_blackness:Float; /*  */ 
var sense_vdir_hue:Float; /*  */ 
var sense_vdir_lightness:Float; /*  */ 
var sense_vdir_opacity:Float; /*  */ 
var sense_vdir_saturation:Float; /*  */ 
var sense_vdir_scatter:Float; /*  */ 
var sense_vdir_size:Float; /*  */ 
var sensitivity_x_y:Int; /* 0 to 100, where x is a value of pressure, speed, hDir, vDir, or random;
and y is a value of: size, angle, opacity, blackness, scatter, hue, lightness, orsaturation. For
example, sensitivity_pressure_size.*/ 
var shape:String; /* Acceptable values are "circle" and "square".*/ 
var softenMode:String; /* Acceptable values are "bell curve" and "linear".*/ 
var softness:Float; /* 0 to 100*/ 
var spacing:Float; /* 0 to 500 (a percentage, as much as 500 percent)*/ 
var textureBlend:Float; /* 0 to 100*/ 
var textureEdge:Float; /* 0 to 100*/ 
var tipColoringMode:String; /* Acceptable values are "random", "uniform", "complementary", "hue",
and "shadow".*/ 
var tipCount:Int; /* 1 to 32*/ 
var tipSpacing:Float; /* 0 to 100*/ 
var tipSpacingMode:String; /* Acceptable values are "random", "diagonal",
and "circular".*/ 
var type:String; /* Acceptable values are "natural" and "simple".*/ 
}