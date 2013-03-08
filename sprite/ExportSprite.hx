/* 
Fireworks JavaScript Command
Exports slices as sprite sheets
Install by copying to Fireworks/Configuration/Commands/ and accessing in Fireworks from the Commands menu
Aaron Beall 2010-2011 - http://abeall.com
Version 1.5.6

*/

/*
haxe port by postite
*/


package;

import js.Lib;
import jsf.Fw;
import jsf.Document;
import jsf.objects.elements.Element;
import jsf.objects.elements.SliceHotSpot;
import jsf.core.Files;
import jsf.objects.ExportOptions;
import jsf.objects.Frame;

///wich native Type ?
typedef File={
	width : Float,
	name : String, 
	height : Float, 
	frames : Array<String>,
	exportOptions : ExportOptions
}
typedef SpriteChildren={
	name:String,
	state:String,
	index:Int,
	x:Float,
	y:Float ,
	?width:Float,
	?height:Float
}

typedef Sprite={
	name:String,
	 url:String,
	 width:Float,
	 height:Float,
	 children:Array<SpriteChildren>
}
class ExportSprite 
{

	var dom:Document; 
	var sel:Array<Element>;
	var slices:Array<SliceHotSpot>;
	var multiSprites:Bool;
	var oldFrameNum:Int;

	var sliceFiles:Array<File>;

	var dir:String;
	var filePath:String;
	var sprites:Array<Sprite>;
	var states:Array<String>;
	public function new()
	{

		dom= Fw.getDocumentDOM(); // document object
		sel=Fw.selection; // saved selection
		//try{
		export();
		exportHtml();
		//exportLess();
		//exportCSS();
		//}catch(e:Dynamic){
			//Lib.alert([e.lineNumber, e, e.fileName]);
		//}

		//Fw.getDocumentDOM().addNewOval({left:72, top:79, right:236, bottom:228});
	}
	function export(){
		if (dom==null)return ;

		// User selected slices
		 slices = new Array<SliceHotSpot>();
		var i = sel.length;
		trace(sel.length);
		for (a in sel){
			 if(cast(a).sliceID!=null){
			 	trace("slice");
			 	slices.push(cast a);
			}
			
			//trace(a);
		}

		// If no slices selected, offer to export all slices on page
	if(slices.length==0){
		trace("no select");
		// TODO: recursive into sublayers
		// TODO: include hotspots?
		
		var allSlices = new Array<SliceHotSpot>();
		for(layer in dom.layers){
			if(layer.layerType == "web"){
				var e:Int = layer.frames[0].elements.length;
				var elements:Array<Element>=layer.frames[0].elements;
				for (el in elements){
					if(cast(el).sliceID!=null)
						allSlices.push(cast el);
				}
				
			}
		}
		// var window= js.Lib.window;
		// untyped(confirm("couuoc"));
		trace("allSlices"+allSlices.length);
		if(allSlices.length > 0 && (untyped(confirm("No slices selected; export all slices?"))!=null))
		slices = allSlices;

		}
		multiSprites=false;

		switchCases();
		selectSaveLocation();

		oldFrameNum = dom.currentFrameNum;

		parseSlices();
		generateSpriteData();
		return ;
	}

	// Export all slices and frames to temp files
	function parseSlices(){
		trace("parseSlice");
		sliceFiles = new Array<File>();
		var sliceNameNum:Int = 1;
		var sliceCount:Int=0;
		for (slice in slices){
			trace("first loop");
			var file:File = {
			width:slice.width,
			height:slice.height,
			exportOptions:(slice.exportOptions!=null)?slice.exportOptions : dom.exportOptions,
			name:(slice.baseName!=null)?slice.baseName : ("Slice" + sliceNameNum++),
			frames:new Array<String>()
			}
			sliceFiles.push(file);

			var opts:ExportOptions = cast{};//new ExportOptions();
			opts.exportFormat = "PNG";
			opts.colorMode = "32 bit";
			opts.crop = true;	
			opts.cropLeft = slice.left - dom.left;
			opts.cropRight = slice.left + slice.width - dom.left;
			opts.cropTop = slice.top - dom.top;
			opts.cropBottom = slice.top + slice.height - dom.top;

			var frameCount:Int=0;
			for(frame in dom.frames){
				trace("2nd loop");
				dom.currentFrameNum = frameCount;
				//fw.selection = [slices[i]];
				trace("step1");
				var tmp = Files.getTempFilePath(null) + "_" + sliceCount + "_" + frameCount;
				trace("step2");
				file.frames[frameCount] = tmp + "." + opts.exportFormat;
				trace("step3");
				Fw.exportDocumentAs(dom, tmp, opts);
				trace("step4");
				frameCount++;
				trace("end2nd loop");
			}
			sliceCount++;
		}
		trace("end ParseSlice");

	}

	function generateSpriteData() 
	{
		trace("generateSpriteData");
		 sprites = new Array<Sprite>();
		// Create combined sprite image(s) and export them
		if(multiSprites){

			// Export each slice as separate image file
			for(i in 0 ... sliceFiles.length){
			
				// Create new document for current slice
				var file = sliceFiles[i];
				Fw.createFireworksDocument({x:file.width, y:file.height * file.frames.length}, {pixelsPerUnit:72, units:"inch"}, dom.backgroundColor);
				
				// Create sprite data for this slice
				var sprite:Sprite = {name:getFilename(file.name), url:getFileURL(file.name, file.exportOptions), width:slices[i].width, height:slices[i].height, children:[]};
				sprites.push(sprite);
				
				// Populate slice sprite images with state images
				for(f in 0...sliceFiles[i].frames.length){
					//alert(sliceFiles[i].frames[f])
					Fw.getDocumentDOM().importFile(sliceFiles[i].frames[f], {left:0, top:file.height * f, right:file.width, bottom:file.height * f + file.height}, false);
					
					sprite.children.push({
						name:sliceFiles[i].name, 
						state:(dom.frames[f].name!=null)?dom.frames[f].name :Std.string(f),
						index:f, x:-Fw.selection[0].left,
						y:-Fw.selection[0].top
						// width:sliceFiles[i].width,
						// height:sliceFiles[i].height
						});

				}
			
				// Export resulting image and return to doc
				Fw.getDocumentDOM().setExportOptions(dom.exportOptions);
				Fw.exportDocumentAs(Fw.getDocumentDOM(), dir + "/" + file.name, file.exportOptions);
				//Fw.getDocumentDOM().close(false);
		}//end  separate file loop

		//if !multisprites
		}else{

			var totalWidth:Float = 0; 
			var totalHeight:Float = 0;
			
			if (dom.frames.length>1){
				states=new Array();
				for (frame in dom.frames){
					states.push(frame.name);
				}
			}
			for(slice in sliceFiles){
				totalWidth += Math.ceil(slice.width);
				totalHeight = Math.max(slice.height * slice.frames.length, totalHeight);
			}
			Fw.createFireworksDocument({x:totalWidth, y:totalHeight}, {pixelsPerUnit:72, units:"inch"}, dom.backgroundColor);
			
			// Create a single sprite data object
			var sprite = {name:getFilename(filePath), url:getFileURL(filePath, dom.exportOptions), width:slices[0].width, height:slices[0].height, children:new Array<SpriteChildren>()};
			//sprites = [sprite];
			sprites.push(sprite);
			// Populate sprite images
			var currX:Float = 0;
			for(i in 0... sliceFiles.length){
				var file = sliceFiles[i];
				for(f in 0...sliceFiles[i].frames.length){
					Fw.getDocumentDOM().importFile(sliceFiles[i].frames[f], {left:currX, top:file.height * f, right:currX + file.width, bottom:file.height * f + file.height}, false);
					sprite.children.push(
						{
							name:sliceFiles[i].name,
						 	state:dom.frames[f].name,
						    index:f,
						    x:-currX,
						    y:-file.height * f ,
						    width:sliceFiles[i].width,
						    height:sliceFiles[i].height
						});
				}
				currX +=file.width;
			}
			
			// Export resulting image and return to doc
			Fw.getDocumentDOM().setExportOptions(dom.exportOptions);
			Fw.exportDocumentAs(Fw.getDocumentDOM(), filePath, dom.exportOptions);
			//fw.getDocumentDOM().close(false);

		}	
	}
	function switchCases():Void{
		if(slices.length==0){
			return Lib.alert("No slices on this page; cannot continue. This command is used to export slices and states into a single sprite image.");
		}else if(slices.length==1){
				if(dom.frames.length==1) {
					multiSprites = false;
					return Lib.alert("There is only one slice and one state; cannot continue. This command is used to export slices and states into a single sprite image. You must select more than one slice or have multiple states in the document.");
				}else if(dom.frames.length>1){
					multiSprites = (Fw.yesNoDialog("Multiple slices are selected. Press YES to export all slices to a single sprite sheet image, press NO to export each slice as a separate sprite image.")==null);
					
				}
		
		}else if(slices.length>1){
			if(dom.frames.length==1) {
				if(untyped(confirm("This page has only one state; slices will be merged into a single sprite image.")==null))
				return;
			}else{
				//genarates multiple files if true
				//todo add Choice
			multiSprites = false;
			}
		}	
		
		
		
		return ;
	}
	function getFilename(url:String){
		return url.split("/").pop().split("\\").pop().split(".").shift();
	}
	
	function getFileURL(url:String, exportOptions:ExportOptions){
		var name = url.split("/").pop().split("\\").pop();
		var extension = exportOptions.exportFormat.toLowerCase();
		if(extension == "jpeg")
			extension = "jpg";
		if(name.indexOf("." + extension) != name.length - 1)
			name += "." + extension;
		return name;
	}
	function selectSaveLocation(){
		
		trace("multisprite"+multiSprites);
	if(!multiSprites){
		filePath = Fw.browseForFileURL("save");
		trace("filePath"+filePath);
	}else{
		//dir = Fw.browseForFolderURL("Select export directory for sprite images", dom.lastExportDirectory || Files.getDirectory(dom.lastExportFile));
		dir = Fw.browseForFolderURL("Select export directory for sprite images",  (Files.getDirectory(dom.lastExportFile)!=null)?Files.getDirectory(dom.lastExportFile):Files.getDirectory(dom.lastExportFile));
		trace("dir");
	}
	trace("check if null");
	if(dir==null && filePath==null)
		return ;
	trace("state2");
	if(filePath==null){
		trace("state3");
		filePath = dir + "/" + ((dom.docTitleWithoutExtension!=null)?dom.docTitleWithoutExtension : "Untitled");
		//filePath = dir + "/" + (dom.docTitleWithoutExtension);
		trace("filePath="+filePath);
	}else if(dir==null){
		trace("state4");
		dir = Files.getDirectory(filePath);
		trace("dir="+dir);
	}
		return;
	}
	function exportHtml(){


	// 	var html = "";
	// if(multiSprites)
	// 	html += "<div id='" + containerID + "'>";
	// for(var i = 0; i < sprites.length; i++){
	// 	if(!multiSprites){
	// 		if(html.length)
	// 			html += "\n";
	// 		html += "<div id='" + sprites[i].name + "'>";
	// 	}
	// 	for(var j = 0; j < sprites[i].children.length; j++){
	// 		if(sprites[i].children[j].index == 0)
	// 			html += "\n\t<" + ITEM_TAG + " "
	// 				 + "href='#' " // TODO: use slice links
	// 				 + "class='" + sprites[i].children[j].name + "'"
	// 				 + ">" + sprites[i].children[j].name
	// 				 + "</" + ITEM_TAG + ">";
	// 	}
	// 	if(!multiSprites)
	// 		html += "\n</div>";
	// }
	// if(multiSprites)
	// 	html += "\n</div>";




		var view =new HTMLView().execute({states:states,sprites:sprites,style:exportCSS()});
		dom.clipCopyJsToExecute(view);
		Lib.alert(view);
	}
	function exportLess(){
	
		var view =new LESSView().execute({states:states,spritename:"picto",sprites:sprites});
		Lib.alert(view);
	}
	function exportCSS():String{
		var view =new CSSView().execute({states:states,spritename:"picto",sprites:sprites});
		return view;
	}


	function renderSpriteNameforHss(spriteData, stateData){
		// example: #nav a:hover.homeBtn
		return ((stateData!=null) ? "" + stateData.name : "")
			+ (stateData && stateData.index > 0 ? "-" + stateData.state : "");
	}

	public static function main(){

		new ExportSprite();
		
	}
}
@:template("
	<style>@style</style>
	<div id='spritetest'>
	@for (sprite in sprites){
		@for(child in sprite.children){
			@if(child.state==states[0]){
			<div class='@sprite.name @child.name'></div>
			}
		}
		
	}
	</div>")
class HTMLView extends erazor.macro.Template<{states:Array<String>,sprites:Array<Sprite>,style:String}>{}


@:template("
	.@spritename { display:block; text-indent:-9999px;}
	@for(sprite in sprites){
				.@sprite.name{ 
						background-image:url('@sprite.url');
						width:@(sprite.width)px;
						height:@(sprite.height)px;
					}
				@for(child in sprite.children){
					@if(child.state==states[0]){

					.@sprite.name.@child.name{
						background-image:url('@sprite.url');
						background-position:@(child.x)px @(child.y)px;
						width:@(child.width)px;
						height:@(child.height)px;
					}
					}else{
						
						.@sprite.name.@child.name:@states[1]{
						background-image:url('@sprite.url');
						background-position:@(child.x)px @(child.y)px;
						width:@(child.width)px;
						height:@(child.height)px;
					}
					}
				}	
					
				}
		
			 ")
class CSSView extends erazor.macro.Template<{states:Array<String>,spritename:String,sprites:Array<Sprite>}>{}

@:template("
	.@spritename { display:block; text-indent:-9999px;}
	@for(sprite in sprites){
				.@sprite.name{ 
						background-image:url('@sprite.url');
						width:@(sprite.width)px;
						height:@(sprite.height)px;
					
				@for(child in sprite.children){
					@if(child.state==states[0]){				
					 .@child.name @{'{';}
					 	background-position:@(child.x)px @(child.y)px;
					 	width:@(child.width)px;
					 	height:@(child.height)px;
					}else{
					 	& :@child.state{
					 		background-position:@(child.x)px @(child.y)px;
					 		width:@(child.width)px;
					 		height:@(child.height)px;
					 	}
					 @{'}';}
					}
				}	
					
				}
			}
		
			 ")
class LESSView extends erazor.macro.Template<{states:Array<String>,spritename:String,sprites:Array<Sprite>}>{}

