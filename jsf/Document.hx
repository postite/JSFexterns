/*Document object properties*/



//http://help.adobe.com/en_US/fireworks/cs/extend/WS5b3ccc516d4fbf351e63e3d1183c94856c-7fff.html
/*The following table lists the properties of the Document object,
 along with their data types, acceptable values, and notes. 
 Read-only properties are marked with a bullet ((default,null)). 
 You can also use many API calls to work with documents. For more information, 
 see Property inspector functions.*/
 ///

package jsf;

import Fw.Point;
import jsf.Brush;
import jsf.Guides;
import jsf.Gradient;
import jsf.Fill;
import jsf.Frame;


import  jsf.PathAttrs;
import  jsf.PngText;
import  jsf.Layer;
typedef Texture={
	name:String //The name that appears in the Brush or Fill panels.
}

@:native("")
extern class Document{
var backgroundColor:String; /* A color String that specifies the document
canvas color (for more information, see Color String data type).*/
var backgroundURL:String; /* Sets a general URL for a document that uses
a hotspot. Everything that is not covered by the hotspot has the
background URL.*/
var brushes (default,null):Array<Brush>; /* Array of Brush objects that are available
for use in the document (for more information, see Brush object).*/
var currentFrameNum:Int;//zero-based index; /* The index of the current frame.*/
var currentLayerNum:Int;//zero-based index; /* The index of the current layer.*/
var defaultAltText:String; /* Default Alt text for the output images.
It works for single and sliced images. Sliced images get the default,
unless specific text is specified for a slice. Corresponds to the
text that is specified in the Document-Specific tab of the HTML
Setup dialog box. */
var docTitleWithoutExtension:String; /* The title of the document file, without
any file extension. If the document has not been saved, this String
is empty.*/
var exportFormatOptions:ExportOptions; /* Identical to exportOptions.
Included for backward compatibility with Fireworks 2.*/
var exportOptions:ExportOptions; /* ExportOptions object (for more information,
see ExportOptions object).*/
var exportSettings:Dynamic; /* ExportSettings object (for more information,
see ExportSettings object).*/
var filePathForRevert:String; /* The path to the file from which this document
was opened, which is expressed as file://URL, or null if
created from scratch.*/
var filePathForSave:String; /* The location to which this document was
saved, which is expressed as file://URL, or null if
never saved.*/
var fills (default,null):Array<Fill>; /* Array of Fill objects that are available
for use in the document (for more information, see Fill object).*/
var frameCount:Int; /* The number of frames in the current document.*/
var frameLoopingCount:Int; /* –1 — don’t repeat0 — repeat forever>
0 — repeat this number of times*/
var frames (default,null):Array<Frame>; /* Array of Frame objects in the document (for
more information, see Frame object).*/
var gammaPreview:Bool; /* If set to true, the document
should be previewed in opposite-platform gamma. If set to false,
the document colors are unadjusted.*/
var gradients (default,null):Array<Gradient>; /* Array of Gradient objects that are available
for use in the document (for more information, see Gradient object).*/
var gridColor:String; /* A color String that specifies the color
of the grid display (for more information, see Color String data type).*/
var gridOrigin:jsf.Point; /* Used to set the origin of the grid. Corresponds
to the point set when dragging the ruler origin from the upper-left
of the document when rulers are visible.*/
var gridSize:jsf.Point; /* gridSize.x is the horizontal
grid size; gridSize.y is the vertical grid size.*/
var guides (default,null):Guides; /* Guides object (for more information, see Guides object).*/
var height:Int; /* Total height of the document, in pixels.
To find the bottom edge of the document, use document.top + document.height. */
var isDirty:Bool; /* Set to true if the document
was modified since the last time it was saved.*/
var isPaintMode (default,null):Bool; /* Set to true if the document
is currently in paint-mode editing, false otherwise.*/
var isSymbolDocument (default,null) :Bool; /* Set to true if the document
is a Symbol or Button document, false if it is
an ordinary document. You might see this when looking through the
list of open documents and one is a symbol-editing window.*/
var isValid:Bool; /* Set to true if the document
is open in Fireworks; false otherwise. (Occasionally
the JavaScript object that is associated with a document lingers
after the document closes; this property lets you check for that
eventuality.)*/
var lastExportDirectory:String; /* The path to the last directory to which
the file was exported, which is expressed as file://URL,
or null if the file was never exported. For instance,
if the document was last exported to “file:///files/current/logo.gif",
it returns "file:///files/current".*/
var lastExportFile:String; /* The name that was used the last time the
file was exported, or null if the file was never
exported. For instance, if the document was last exported to "file:///files/current/logo.gif",
it returns "logo.gif".*/
var layers (default,null):Array<Layer>; /* An Array of Layer objects
in the document (for more information, see Layer object).*/
var left:Int; /* Coordinate of the left edge of the document,
in pixels. To find the right edge of the document, use document.left + document.width. */
var mapType:String; /* Acceptable values are "client", "server",
and "both". Corresponds to the image-map type selected
in File > HTML Setup.*/
var matteColor:String; /* A color String that corresponds to the matte
color specified in the Optimize panel (for more information, see Color String data type). This String is used by the useMatteColor property.*/
var onionSkinAfter:Int; /* The number of frames after the current frame
to show through onion skinning. Corresponds to the onion-skin controls
in the left edge of the Frames panel. A value of 0 indicates
no onion skinning; a very large value (such as 99,999)
indicates onion skinning of all frames after the current frame.*/
var onionSkinBefore:Int; /* Similar to the onionSkinAfter property,
but refers to the number of frames to show through onion skinning
before the current frame.*/
var pagesCount (default,null):Int; /* Returns the number of pages in the current
document. */
var pageName:String; /* Returns the page name of the current page.*/
var patterns (default,null):Dynamic; /* The list of internal pattern names.*/
var pathAttributes:PathAttrs; /* The PathAttrs object (for more information,
see PathAttrs object).
This object specifies default attributes that will be applied to
all newly created objects.*/
var pngText:PngText; /* A structure that can be used to store various
chunks of text in a well-known format. For more information, see The pngText property.*/
var resolution:Float; /* Document resolution, in pixels per unit
(for more information, see resolutionUnits). The
range is 1 to 5000.*/
var resolutionUnits:String; /* Units to be used with the resolution property.
Acceptable values are "inch" and "cm".*/
var savedSelections:Array<Dynamic>; /* Array of the saved bitmap selections in
the active document.*/
var textures:Array<Texture>; /* Array of Texture objects that are available
for use in the document (for more information, see Texture object).*/
var top:Int; /* Coordinate of the top edge of the document,
in pixels. To find the bottom edge of the document, use document.top + document.height. */
var useMatteColor:Bool; /* If set to true, the matteColor property
is used when exporting documents with transparent backgrounds. If
set to false, the matteColor property
is ignored in this situation, and the exported file is matted against
the document’s canvas color.*/
var width:Int; /* The width of the document, in pixels. To
find the right edge of the document, use document.left + document.width.*/
var currentPageNum:Int; /* The index of the current page.*/
var topLayers:Array<Dynamic>; /* Array of top level layers within the document
objects.*/





////////METHODS//////////



/*
public function addBehavior()
public function addElementMask()
public function addFrames()
public function addGuide()
public function addMasterPageLayer()
public function addNewHotspot()
public function addNewImage()
public function addNewImageViaCopy()
public function addNewImageViaCut()
public function addNewLayer()
public function addNewLine()
*/


public function addNewOval(boundingRectangle:jsf.Rectangle):Void;

/*
public function addNewPage()
public function addNewRectangle()
public function addNewRectanglePrimitive()
public function addNewSinglePointPath()
public function addNewStar()
public function addNewSubLayer()
public function addNewSymbol()
public function addNewText()
public function addSwapImageBehaviorFromPoint()
public function adjustExportToSize()
public function adjustFontSize()
public function align()
public function appendPointToHotspot()
public function appendPointToPath()
public function appendPointToSlice()
public function applyCharacterMarkup()
public function applyCurrentFill()
public function applyEffects()
public function applyFontMarkup()
public function applyStyle()
public function arrange()
public function attachTextInPath()
public function attachTextToPath()
public function breakLink()
public function changeCurrentPage()
public function changeGuide()
public function changeNineScaleGuide()
public function changeSliceGuide()
public function clearJPEGMask()
public function clipCopy()
public function clipCopyAsPaths()
public function clipCopyFormats()
public function clipCopyJsToExecute()
public function clipCut()
public function clipPaste()
public function clipPasteAsMask()
public function clipPasteAttributes()
public function clipPasteFromChannelToChannel()
public function clipPasteInside()
public function cloneSelection()
*/

/*Arguments
bPromptToSaveChanges If bPromptToSaveChanges is true, and the document was changed since the last time it was saved, the user is prompted to save any changes to the document. If bPromptToSaveChanges is false, the user is not prompted, and changes to the document are discarded.*/
public function close(bPromptToSaveChanges:Bool):Void;

/*
public function convertAnimSymbolToGraphicSymbol()
public function convertMarqueeToPath()
public function convertPathToMarquee()
public function convertToAnimSymbol()
public function convertToPaths()
public function convertToSymbol()
public function convolveSelection()
public function copyHtmlWizard()
public function copyToHotspot()
public function cropSelection()
public function deleteAllInDocument()
public function deleteFrames()
public function deleteLayer()
public function deletePageAt()
public function deletePointOnPath()
public function deleteSavedSelection()
public function deleteSelection()
public function deleteSymbol()
public function detachInstanceFromSymbol()
public function detachSharedLayer()
public function distribute()
public function distributeLayerToFrames()
public function distributeSelectionToFrames()
public function dragControlPoint()
public function duplicateFrame()
public function duplicateLayer()
public function duplicatePage()
public function duplicateSelection()
public function duplicateSelectionToFrameRange()
public function duplicateSelectionToFrames()
public function duplicateSymbol()
public function duplicateSymbolForAlias()
public function elementsAt()
public function enableElementMask()
public function enableNineScale()
public function enableTextAntiAliasing()
public function enterPaintMode()
public function exitPaintMode()
public function exitSymbolEdit()
public function exportElements()
public function exportOptions.loadColorPalette()
public function exportOptions.saveColorPalette()
public function exportTo()
public function fillSelectedPixels()
public function filterSelection()
public function filterSelectionByID()
public function filterSelectionByName()
public function findNamedElements()
public function flattenDocument()
public function flattenSelection()
public function getFontMarkup()
public function getLockGuides()
public function getPageSetter()
public function getParentLayerNum()
public function getPixelMask()
public function getSelectionBounds()
public function getShowGrid()
public function getShowGuides()
public function getShowRulers()
public function getSnapToGuides()
public function getSnapToGrid()
public function getTextAlignment()
public function group()
public function hasCharacterMarkup()
public function hasMasterPage()
public function hideSelection()
*/



/*Arguments
fileURL The filename of the file to be imported, which is expressed as a file://URL.
boundingRectangle A rectangle that specifies the size to make the imported file (see Rectangle data type). If boundingRectangle is specified with left == right and top == bottom, the file is brought in unscaled with its top-left corner at the specified location, and the third argument is ignored.
bMaintainAspectRatio If bMaintainAspectRatio is true, the file is scaled to the largest size that fits within boundingRectangle while retaining the file’s current aspect ratio. (This is a handy option for creating thumbnails.) If it is false, the file is scaled to fill boundingRectangle.
Returns
Nothing.

Description
Imports the specified file at the specified location.

Example
The following command imports the specified file and maintains its aspect ratio:

fw.getDocumentDOM().importFile("file:///C|/images/foo.psd", {left:25, top:50, right:100, bottom:250}, true);*/
public function importFile(fileURL:String, boundingRectangle:Rectangle, bMaintainAspectRatio:Bool):Void;

/*
public function importSymbol()
public function importSymbolButNotAsAlias()
public function inLaunchAndEdit()
public function insertPointInPath()
public function insertSmartShapeAt()
public function insertSymbolAt()
public function insertText()
public function isMasterPageLayer()
public function isSelectionDirectlyAboveBitmapObject()
public function joinPaths()
public function knifeElementsFromPoint()
public function knifeElementsFromPoints()
public function linkElementMask()
public function lockNineScale()
public function lockSelection()
public function makeFind()
public function makeActive()
public function mergeDown()
public function modifyPointOnPath()
public function motionBlurSelection()
public function moveBezierHandleBy()
public function moveElementMaskBy()
public function moveFillVectorHandleBy()
public function moveMaskGroupContentsBy()
public function moveNineScaleGuide()
public function movePixelMaskBy()
public function movePointOnHotspotBy()
public function movePointOnHotspotByWithFlags()
public function moveSelectedBezierPointsBy()
public function moveSelectionBy()
public function moveSelectionMaskBy()
public function moveSelectionTo()
public function moveSelectionToFrame()
public function moveSelectionToLayer()
public function moveSelectionToNewLayer()
public function pagesCount
public function pageName()
public function pathCrop()
public function pathExpand()
public function pathInset()
public function pathIntersect()
public function pathPunch()
public function pathSimplify()
public function pathUnion()
public function placeTextInPath()
public function previewInBrowser()
public function previewAllPagesInBrowser()
public function rebuildColorTable()
public function redefineStyleByName()
public function redo()
public function redraw()
public function redrawSmartShape()
public function reflectSelection()
public function removeAllGuides()
public function removeBehavior()
public function removeBrush()
public function removeCharacterMarkup()
public function removeElementMask()
public function removeFontMarkup()
public function removeFill()
public function removeGuide()
public function removeNineScale()
public function removeTransformation()
public function reorderFrame()
public function reorderLayer()
public function reorderPages()
public function replaceButtonTextStrings()
public function replaceButtonTextStringsInInstances()
public function replaceTextString()
public function resetNineScale()
public function resizeSelection()
public function restoreJPEGMask()
public function restoreSelection()
public function reversePathTextDirection()
public function rotateDocument()
public function rotateSelection()
public function save()
public function saveCopyAs()
public function saveJPEGMask()
public function saveSelection()
public function scaleSelection()
public function scalingGridRect()
public function selectAdjustPixelSel()
public function selectAll()
public function selectAllOnLayer()
public function selectChildren()
public function selectFeather()
public function selectInverse()
public function selectNone()
public function selectParents()
public function selectSimilar()
public function selectSimilarFromPoint()
public function sendEmail()
public function setAllLayersDisclosure()
public function setAnimInstanceLoopCount()
public function setAnimInstanceNumFrames()
public function setAnimInstanceOffsetDist()
public function setAnimInstanceRotationAmount()
public function setAnimInstanceScaleAmount()
public function setAnimInstanceStartEndOpacity()
public function setAnimInstanceStartFrame()
public function setBlendMode()
public function setBrush()
public function setBrushColor()
public function setBrushName()
public function setBrushNColor()
public function setBrushNColorNTexture()
public function setBrushPlacement()
public function setButtonAutoSlice()
public function setButtonIncludeDownState()
public function setButtonIncludeOverWhileDownState()
public function setButtonShowDownOnLoad()
public function setButtonOptions()
public function setDefaultBrushAndFillColors()
public function setDefaultFillVector()
public function setDocumentCanvasColor()
public function setDocumentCanvasSize()
public function setDocumentCanvasSizeToDocumentExtents()
public function setDocumentCanvasSizeToSelection()
public function setDocumentImageSize()
public function setDocumentResolution()
public function setEffectName()
public function setElementLocked()
public function setElementLockedByName()
public function setElementMaskMode()
public function setElementMaskShowAttrs()
public function setElementName()
public function setElementVisible()
public function setElementVisibleByName()
*/


public function setExportOptions(exportOptions:ExportOptions):Void;
/*
public function setExportSettings()
public function setFill()
public function setFillColor()
public function setFillEdgeMode()
public function setFillNColor()
public function setFillNColorNTexture()
public function setFillPlacement()
public function setFillVector()
public function setFillVectorStart()
public function setGradientName()
public function setGridOrigin()
public function setGridSize()
public function setGridColor()
public function setGroupType()
public function setGuideColor()
public function setHotspotAltTag()
public function setHotspotColor()
public function setHotspotRectangle()
public function setHotspotShape()
public function setHotspotTarget()
public function setHotspotText()
public function setLayerDisclosure()
public function setLayerLocked()
public function setLayerName()
public function setLayerSharing()
public function setLayerVisible()
public function setMasterPage()
public function setMatteColor()
public function setNineScaleGuideColor()
public function setPixelMask()
public function setOnionSkinning()
public function setOpacity()
public function setPageName()
public function setQuadrangle()
public function setRectRoundness()
public function setRectRoundnessMode()
public function setRectSides()
public function setSelectionBounds()
public function setSelectionMask()
public function setShowEdges()
public function setShowGammaPreview()
public function setShowGrid()
public function setShowGuides()
public function setShowRulers()
public function setShowSliceGuides()
public function setShowSliceOverlay()
public function setSliceAutonaming()
public function setSliceType()
public function setSliceExportOptions()
public function setSliceFilename()
public function setSliceGuideColor()
public function setSliceHtml()
public function setSliceIsHtml()
public function setSnapToGrid()
public function setSnapToGuides()
public function setSymbolProperties()
public function setTextAlignment()
public function setTextAntiAliasing()
public function setTextAutoKern()
public function setTextCharSpacing()
public function setTextCustomAntiAliasOverSample()
public function setTextCustomAntiAliasSharpness()
public function setTextCustomAntiAliasStrength()
public function setTextFlow()
public function setTextHorizontalScale()
public function setTextLeading()
public function setTextOnPathMode()
public function setTextOnPathOffset()
public function setTextOrientation()
public function setTextParaIndent()
public function setTextParaSpacingAfter()
public function setTextParaSpacingBefore()
public function setTextRuns()
public function setTransformMode()
public function setTextRectangle()
public function setTextRectangleAuto()
public function setTextRectangleAutoFromPoint()
public function setWebObjectsVisibility()
public function shareLayerToPages()
public function showAllHidden()
public function snapToPixel()
public function splitPaths()
public function swapBrushAndFillColors()
public function transformSelection()
public function tween()
public function undo()
public function updateSymbol()
public function ungroup()
public function unsetMasterPage()

*/
//apparently only available from a FW object
//additional meth from Fw getDocumentDom queries..
///TODO

public function combineCompoundShape():Void;
public function createCompoundShape():Void;
public function InsertPageForImport():Void;
public function VectorOperation():Void;





}