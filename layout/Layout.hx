import jsf.objects.elements.HotSpot;
import jsf.Fw;
import jsf.objects.elements.Element;
import jsf.objects.ExportOptions;
import jsf.core.Files;
import jsf.objects.elements.SliceHotSpot;
import jsf.objects.elements.Text;
import jsf.objects.RectanglePrimitive;
import jsf.objects.Layer;
import jsf.Rectangle;
import de.polygonal.ds.TreeBuilder;
import de.polygonal.ds.TreeNode;
import de.polygonal.ds.TreeBuilder;
import jsfTools.ObjectHash;
import jsfTools.exp.CSS;

typedef File={
	fileName:String,
	name:String,
	width:Float,
	height:Float,
	content:String,
}

typedef TypedElement={
	type:String,
	element:Element,
	?sims:List<Element>
}

class Layout 
{

	var fluid:Bool=true;
	var ignoreMap:ObjectHash<Bool>;
	var hots:Array<HotSpot>;
		var r:EReg;
		var dom:jsf.Document;
		var exportables:Array<File>;
		var dir:String;

	function new()
	{
		dom= Fw.getDocumentDOM();
		//dir = Fw.browseForFolderURL("Select export directory for sprite images");
		dir = Fw.browseForFolderURL("Select export directory for  images",  (Files.getDirectory(dom.lastExportFile)!=null)?Files.getDirectory(dom.lastExportFile):Files.getDirectory(dom.lastExportFile));

		parseSlice(true);

		//checkZoneType();

		
		//exportHTML();
		//trace(exportables.length);
	}

	 public function overlaps(Rect:Rectangle,R2:Rectangle):Bool
	{
		// Rect.width=Rect.right-Rect.left;
		// Rect.height=Rect.bottom-Rect.top;
		// R2.width=R2.right-R2.left;
		// R2.height=R2.bottom-R2.top;
		
		return (Rect.right > R2.right) && (Rect.left < R2.left) && (Rect.bottom > R2.bottom) && (Rect.top < R2.top);
	}

	




	function match(elem:Element,obj:String):Bool{
		r  = ~/(object) ([a-zA-Z0-9_]+)/;
		 var str = Std.string(elem);
		 r.match(str);
		 if( r.matched(2)==obj)return true;

		 return false;
	}
	function generateImage(slice:HotSpot) 
	{
		//trace("generate");
		var opts:ExportOptions = cast{};//new ExportOptions();
			opts.exportFormat = "PNG";
			opts.colorMode = "32 bit";
			opts.optimized=true;
			opts.crop = true;	
			opts.cropLeft = slice.left - dom.left;
			opts.cropRight = slice.left + slice.width - dom.left;
			opts.cropTop = slice.top - dom.top;
			opts.cropBottom = slice.top + slice.height - dom.top;
			//trace("dir="+dir);
			var tmp = dir +"/"+ slice.name+".png";
			//var tmp = slice.name+".png";
			//trace("tmp="+tmp);
			trace("export="+Fw.exportDocumentAs(dom, tmp, opts));
			return slice.name+".png";
	}


	function checkZoneType(?slice:HotSpot):TypedElement
	{
		//var slice:HotSpot=null;
		var typed:TypedElement=null;
		if (slice==null)slice= cast Fw.selection[0];
		//trace("slice name="+slice.name);
		for( l in dom.layers){
		if(l.layerType != "web"){
			//trace("in not web layers");
			var numSimilar:List<Element>= new List();
			for(e in l.frames[dom.currentFrameNum].elements){
				//trace("elements");
				/// check if not layer == web
				var elem = e;
				if(doSelectSimilar(elem,slice)){
					trace("similar");
					if( match(elem,"Text")){
						var textElem:Text= cast elem;
						trace (textElem.textChars);
						numSimilar.add(elem);
						trace("sims="+numSimilar.length);
						typed= {type:"text",element:textElem,sims:numSimilar};
						
					}
					if( match (elem,"Image")){
					//	trace("it's anImage");
						typed= {type:"image",element:elem};
						
					}
					}else{
						//trace("pas trouvé");
						continue;
					}
			}
		}
		}
		 return typed;
	}
	function doSelectSimilar(elem:Element,hot:HotSpot):Bool{
		
		if (overlaps(hot.pixelRect,elem.pixelRect)){
		trace("elem"+elem.name);
		return true;
		}

		return false;
	}

	function parseSlice(gen:Bool) 
	{
		exportables= new Array();
		hots= new Array();
		var allSlices = new Array<SliceHotSpot>();
		for(layer in dom.topLayers){
			//trace("layer");
			if(layer.layerType == "web"){
				//trace("web layer");
				//var e:Int = layer.frames[0].elements.length;
				var elements:Array<Element>=layer.frames[0].elemsandsublayers;
				for (el in elements){
					////trace("?hotspot"+el);

					if( match(el,"Hotspot")){
						var HS:HotSpot=cast el;
						var color=HS.color;
						//trace("real hotspot"+color);
						var t:Rectangle=cast {left:41,top:49,right:180,bottom:180};
						//trace( "overlaps?"+overlaps(t,HS.pixelRect));
						//trace(HS.pixelRect);
						hots.push(HS);
					}


					if(cast(el).sliceID!=null){
						//trace("hotspot !");
						var slice:SliceHotSpot=cast el;
						//trace("options"+slice.pixelRect.left);
						//trace("name"+slice.color);
						var source:String="";
						if (slice.sliceKind=="image"){
							//trace("imaaaage");
							(gen)? source=generateImage(slice):source="";
						}
						exportables.push({

							name:slice.baseName,
							fileName:slice.baseName+".png",
							width:slice.width,
							height:slice.height,
							content:slice.htmlText
						});
						allSlices.push(slice);
					} // fin it'sa slice
					//begin sous calque
					if(el.isLayer){
						//trace("it' a sub layer "+el.name);
						var sub:Layer= cast el;
						for (subel in sub.elems){

						//trace("?hotspot");

					if(cast(subel).sliceID!=null){
						//trace("hotspot !");
						var slice:SliceHotSpot=cast subel;
						//trace("options"+slice.pixelRect.left);
						//trace("name"+slice.color);
						var source:String="";
						if (slice.sliceKind=="image"){
							//trace("imaaaage");
							(gen)? source=generateImage(slice):source="";
						}
						exportables.push({

							name:slice.baseName,
							fileName:slice.baseName+".png",
							width:slice.width,
							height:slice.height,
							content:slice.htmlText
						});
						allSlices.push(slice);
					}
					}
				}
			}
				
			}
		}
		//trace("hotslenght"+hots.length);
		hots.sort(trieHots);
		for(h in hots){
			///trace("listeItem="+h.color);
		}
		///hots.reverse();
		//imbrique();
		var tree=imbriqueWrap();
		tree.postorder(traverse);
		// if (tree!=null)
		// trace(tree.toString());
		exportTree(tree);
		//if(allSlices.length > 0 && (untyped(confirm("No slices selected; export all slices?"))!=null))
		//slices = allSlices;
	}
	function traverse(a:TreeNode<HotSpot>,dy:Dynamic):Bool 
	{
		if( a.val!=null)
		//trace("a="+a.val.color);
		a.sort(Xsorting);

		return true;

		
		  //
	}
	function Xsorting(a:HotSpot,b:HotSpot):Int 
	{

		//return Std.int(a.pixelRect.left-b.pixelRect.left);
		var xPos=Std.int(a.pixelRect.left-b.pixelRect.left);
		var yPos=Std.int(a.pixelRect.top-b.pixelRect.top);

		if (Math.abs(yPos)<10)
		return xPos;
		if (Math.abs(xPos)<10) return yPos;
		return 0;
	}

	function imbriqueWrap():TreeNode<HotSpot>{
		ignoreMap= new ObjectHash();
		contained= new ObjectHash();
		containers= new ObjectHash();
		inTree= new ObjectHash();
		var liste= Lambda.list(hots);
		var tree:TreeNode<HotSpot>= new TreeNode(null);
		trace(liste.last().width);
		var builder:TreeBuilder<HotSpot>= new TreeBuilder(tree);
		// var iter2:Iterator<HotSpot>=liste.iterator();
		// var first=liste.first();
		// var second= iter2.next();
		imbriqueReq(liste.first(),tree,liste);
		//trace(tree.toString());
		return tree;
	}
	var contained:ObjectHash<Bool>;
	var containers:ObjectHash<Bool>;
	var inTree:ObjectHash<Bool>;
function imbriqueReq (big:HotSpot,tree:TreeNode<HotSpot>,liste:List<HotSpot>){
	//var liste= liste;
	//trace("big="+big.width);
	
	var cont:TreeNode<HotSpot>=new TreeNode(big);
	//trace("big="+big.color);
	for (minus in liste){
		//trace("minus="+minus.color);
		var min=new TreeNode(minus);
		// 

	//	trace("ignored before overlaps"+ignoreMap.get(minus)+" "+minus.color);
		ignoreMap.set(big,true);
		//trace("op" +minus.width);
		
		if(overlaps(big.pixelRect,minus.pixelRect)){
		// trace("ignored"+ignoreMap.get(minus)+" "+minus.color);
		//if (ignoreMap.get(minus)!=true){
		// trace("big"+big.color+" overlaps"+minus.color);
		//}
		 	/// si plusieur niveau .. on deplace
		 	if(containers.get(minus)){
			//trace("has children/parent" +min.val.color);
			var dep=tree.find(minus);
			//no need to remove
			cont.appendNode(dep);
			containers.set(big,true);
			ignoreMap.set(minus,true);
			liste.remove(minus);
			continue;
			}
			
		 	if(!inTree.get(big)){
		 	//if(!ignoreMap.get(big))
			tree.appendNode(cont);
			inTree.set(big,true);
			}
			containers.set(big,true);
			ignoreMap.set(big,false);

			//if(!ignoreMap.get(minus))
			if(!contained.get(minus)){
			
				cont.appendNode(min);
				contained.set(minus,true);
				ignoreMap.set(minus,true);
				//trace("appendNode quand même?" +min.val.color +"to" +cont.val.color);
			}	
				
		  	//liste.remove(minus);	
		  	//}//fin ignoremapsminus
		 }//fin overlaps
		

		//big.customData.ez=true;
		if(!ignoreMap.get(minus))
		//if (Lambda.has(liste,minus))
	 	imbriqueReq(minus,tree,liste);

		}
		
	}
	function imbrique() 
	{
		var liste= Lambda.list(hots);
		var tree:TreeNode<HotSpot>= new TreeNode(liste.last());
		trace(liste.last().width);
		var builder:TreeBuilder<HotSpot>= new TreeBuilder(tree);
		
		var iter2:Iterator<HotSpot>=liste.iterator();
		//var containable= liste.first();
		var cont:TreeNode<HotSpot>=new TreeNode(null);
		for (containable in liste){	
			var iter:Iterator<HotSpot>=liste.iterator();
			var cur=liste.first();
			var curNode:TreeNode<HotSpot>=new TreeNode(null);
			
			for( cur in liste){
			 	//trace("-------cur="+cur.color);
			 			if(overlaps(containable.pixelRect,cur.pixelRect)){
						//trace("----****"+containable.width);
						if(!cont.hasParent())
			 			cont=builder.appendChild(containable);
			 			containable.customData.isNode=true;
			 			containable.customData.isParent=true;
			 			//containable.customData.node=cont;
			 			liste.remove(containable);
			 			curNode=new TreeNode(cur);
			 			if(  cur!=containable)
						cont.appendNode(curNode);
						cur.customData.isNode=true;
						liste.remove(cur);
						}
						if(cur.customData.isParent && cur!=containable){
						// 	//cont.appendNode(cur.customData.node);
						// var dep=tree.find(cur);
						// if( dep!=null){
						// 	//trace("isNode -------- "+cur.color+" papa="+dep.children);
						// dep.unlink();
						// cont.appendNode(dep);
						// }
						////trace("dep="+dep);

						}
						//if( cont.val!=null)
			 			
				
			 		//cur=iter.next();
			 }
			//trace("contisnode="+containable.customData.isnode);
			cont=new TreeNode(containable);
			//trace(containable.color);
			
			//trace("tree="+tree.toString());
			
		}
		tree.levelorder(visit);
		trace("tree="+tree.toString());
		exportTree(tree);
		
	}

	function visit(t:TreeNode<HotSpot>,d:Dynamic):Bool 
	{
		//trace("--"+t.depth())
	
		if( t.val!=null){
			//trace(t.val.color);
		}
		return true;
	}

	function trieHots(h1:HotSpot,h2:HotSpot):Int
	{
		var Rect= h1.pixelRect;
		var R2=h2.pixelRect;
		Rect.width=Rect.right-Rect.left;
		Rect.height=Rect.bottom-Rect.top;
		R2.width=R2.right-R2.left;
		R2.height=R2.bottom-R2.top;

		return Std.int(Rect.width-R2.width);
	}

	function proceedSlice(arguments) 
	{
		
	}
	function exportHTML()
	{
			var view =new LayoutView().execute({files:exportables});
			//dom.clipCopyJsToExecute(view);
			dom.pngText.HTML=view;
			//trace("HTML="+dom.pngText.HTML);
	}

	function exportTree(tree:TreeNode<HotSpot>) 
	{
		//var view =new Tree2View().execute({tree:tree,recHelper:helper});
		//trace("view="+view);
		toHtml(tree.children);
		//tree.postorder(generateDivs);



	}
	///////utils
	function globalToLocal(local:Rectangle,relative:Rectangle){
		var bounds=["top","right","bottom","left"];
		var localized:Rectangle= cast{};
		for ( dir in bounds){
			var propL=Reflect.field(local,dir);
			var propR=Reflect.field(relative,dir);
			var newvalue=propL-propR;
			Reflect.setField(localized,dir,newvalue);
		}
		return localized;
	}
	// DisplayObject.prototype.globalToLocal = function(point) {
 //                if(!(point instanceof Point)) throw new ArgumentError("A Point is required.");
 //                var pt = new Point(point.x - Number(this.absX), point.y - Number(this.absY));
 //                pt.oldx = point.x;
 //                pt.absx = this.absX;
 //                return pt;
 //    }
 //    DisplayObject.prototype.localToGlobal = function(point) {
 //                if(point === undefined) throw new ArgumentError("A Point is required");
 //                return new Point(point.x + Number(this.absX), point.y + Number(this.absY));
 //    }


        ///


	//à l'arrache
	function calculeSpanWidth(spot:HotSpot,node:Xml,parentSpot:HotSpot):String 
	{
		var spanW=60;
		var gridW=960;
		var margin=24;
		var spotW=spot.width;
		var ratio=Math.ceil(spotW/(spanW+margin));
		if (spot.width>= spanW && parentSpot.color=="#00ffff")
		return Std.format("span$ratio");

		var relativeBounds=globalToLocal(spot.pixelRect,parentSpot.pixelRect);
		trace("relativeBounds="+relativeBounds);

		node.set("style",Std.format("width:${Math.round(spot.width)}px;
			height:${Math.round(spot.height)}px;
			background:${spot.color};
			top:${relativeBounds.top}px;
			right:${relativeBounds.right}px;
			bottom:${relativeBounds.bottom}px;
			left:${relativeBounds.left}px;
			position:absolute;"));
	// node.set("style",Std.format("width:${Math.round(spot.width)}px;
	// 		height:${Math.round(spot.height)}px;
	// 		background:${spot.color};
	// 		margin-top:${relativeBounds.top}px;
	// 		margin-left:${relativeBounds.left}px;
	// 		"));
		return  Std.format("petit");
	}

	function htmlrecurse(tree:TreeNode<HotSpot>,xml:Xml):Xml{
		
		for (node in tree.childIterator()){
			var _node=Xml.createElement("div");
			var treenode=tree.find(node);
			if(treenode.parent.val.color=="#00ffff")
			_node.set("class",calculeSpanWidth(node,_node,treenode.parent.val));

			if( node.color=="#00ffff"){
			_node.set("class",(fluid)? "row-fluid": "row");
			}
			if (treenode.parent.val.color!="#00ffff" && node.color!="#00ffff" ){
			_node.set("class","_"+node.color+ " "+ node.name );
			//temporaire
				if(treenode.hasChildren() && treenode.children.val.color=="#00ffff"){
					}else{
				}

				//_node.set("class",calculeSpanWidth(node,_node,treenode.parent.val));
				_node.set("style",Std.format("width:${Math.round(node.width)}px;height:${Math.round(node.height)}px;background:${node.color}"));
			}

				xml.addChild(_node);
				if(treenode.hasChildren()){
				htmlrecurse(treenode, _node);
				}else{
				//_node.addChild(Xml.createCData("nope"));
				// var img=Xml.createElement("img");

				// _node.addChild(img);
				// img.set("src",generateImage(node));
				var exportXml=generateExport(node);
				_node.addChild(exportXml);
				}

		}
		return xml;
	}
	function generateText(typedElement:TypedElement):Xml
	{
		trace("generateText");
		var retXml:Xml=null;
		if( typedElement.sims.length>1){

			retXml= Xml.createElement("section");
			for( elem in typedElement.sims){
				var textelem:Text= cast elem;
				var tag=getTextTag(textelem);
				var subXml=Xml.parse(Std.format('<${tag.tagName}>${textelem.textChars}</${tag.tagName}>'));
				var style=CSS.cssFromTextObject(textelem);
				//trace("style="+"'"+style+"'");
				//xml.firstElement().set("style","font-family:Frutiger LT 57 Condensed;font-style:italic;color:#f0f;line-height: 121%;padding-bottom:2px;padding-top:1px");
				//xml.firstElement().set("style","line-height: 121%;font-family:Frutiger LT 57 Condensed;font-style:italic;color:#f0f;padding-bottom:2px;padding-top:1px");
				subXml.firstElement().set("style",style);
				retXml.addChild(subXml);
			}
		}else{
			var textelem:Text= cast typedElement.element;
			var tag=getTextTag(textelem);
			 retXml=Xml.parse(Std.format('<${tag.tagName}>${textelem.textChars}</${tag.tagName}>'));
			var style=CSS.cssFromTextObject(textelem);
			//trace("style="+"'"+style+"'");
			//xml.firstElement().set("style","font-family:Frutiger LT 57 Condensed;font-style:italic;color:#f0f;line-height: 121%;padding-bottom:2px;padding-top:1px");
			//xml.firstElement().set("style","line-height: 121%;font-family:Frutiger LT 57 Condensed;font-style:italic;color:#f0f;padding-bottom:2px;padding-top:1px");
			retXml.firstElement().set("style",style);
			
		}
		return retXml;
	}
	function generateExport(hot:HotSpot):Xml
	{

		var typedElement:TypedElement=checkZoneType(hot);
		if( typedElement==null)return Xml.createElement("pif");

		trace( typedElement.type);
		var xml:Xml;
		switch (typedElement.type) {
			case "text":
			//var textelem:Text= cast typedElement.element;
			trace("before generateText");
			xml=generateText(typedElement);
			trace("after generateText");
			return xml;
			case "image":
			var hotelem:HotSpot= cast typedElement.element;
			xml=Xml.parse(Std.format('<img src="${generateImage(hotelem)}"/>'));
				return xml;
			default:
			xml=Xml.parse(Std.format('<div>paf</div>'));
			return xml;
		}
	}
function getTextTag(text:Text):{name:String,tag:String,tagName:String} 
{

	var textname=text.name; //<h1>pipo
	var tags = ~/^<(a|blockquote|div|h1|h2|h3|h4|h5|h6|label|p|span)>/;
   if( tags.match(textname)){ 
    var name= tags.replace(textname, "");////pipo
    var tag= tags.matched(0);//<h1>
    var tagName=tags.matched(1);//h1
    return {name:name,tag:tag,tagName:tagName}
	}
	return {name:textname,tag:"<p>",tagName:"p"};
}
function toHtml(tree:TreeNode<HotSpot>):String
{
	var xml:Xml=Xml.createElement("div");
	xml.set("class",tree.val.name);
	var outXml=htmlrecurse(tree,xml);
	trace(outXml.toString());
	dom.pngText.HTML=outXml.toString();
	trace("after dom.pngText");
	//dom.clipCopyJsToExecute(outXml.toString());
	return "pol";
}
	
	var html:String;
	function generateDivs(t:TreeNode<HotSpot>,d:Dynamic) 
	{
		html+=t.val.color;
	}
	static public function main()
	{
		var app = new Layout();
	}
}





@:template("
	<div class='page'>
	@{var child=tree.children;}
	@for(c in tree.childIterator()){
		<div class='container'>
		@for(s in child.childIterator()){
			<div>@s.color</div>
		}
			@{child=child.next;}
		</div>
	}
	</div>
	")
class TreeView extends erazor.macro.Template<{tree:TreeNode<HotSpot>}>{}

@:template("
	
	<div id='layoutTest'>
	@for (file in files){
		
	<div class='@file.name' style='width:@file.width'>
	@if(file.fileName!=null){<img src='@file.fileName' />}
		@file.content
	</div>
		
	}
	</div>")
class LayoutView extends erazor.macro.Template<{files:Array<File>}>{}
