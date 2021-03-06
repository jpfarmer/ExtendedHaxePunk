package extendedhxpunk.ui;

import flash.display.BitmapData;
import flash.geom.Point;
import com.haxepunk.graphics.Image;
import extendedhxpunk.ext.EXTUtility;
import extendedhxpunk.ext.EXTColor;

/**
 * UIImageView
 * A subclass of UIView which renders an image within its bounds.
 * @author Fletcher, 9/7/13, ported by Jams, 11/11/13
 */
class UIImageView extends UIView 
{
	/**
	 * The image to render in this view
	 */
	public var image(get, set):Image;
	public function get_image():Image 
	{ 
		return _image;
	}
	public function set_image(image:Image):Image 
	{
#if !(flash || js)
		if (image != null)
			image.layer = 0;
#end
		_image = image;
		this.updateImage(); 
		return _image;
	}
	
	/**
	 * Constructor
	 * @param	position	The initial position of the View, relative to its parent
	 * @param	image		The image to render in this view and determine its size
	 */
	public function new(position:Point, initialImage:Image) 
	{
		var size:Point = initialImage != null ? 
						 new Point(initialImage.scaledWidth, initialImage.scaledHeight) :
						 new Point();
		super(position, size);
		this.image = initialImage;
	}
	
	/**
	 * Update the view's size according to the size of the image
	 */
	public function updateImage():Void
	{
		this.size = _image != null ? 
					new Point(_image.scaledWidth, _image.scaledHeight) :
					new Point();
					
		if (this.fillColor != null && _image != null)
			_image.color = this.fillColor.webColor;
	}
	
	/**
	 * Override fillColor setter to set the color of the image
	 */
	override public function set_fillColor(color:EXTColor):EXTColor
	{
		super.fillColor = color;
		_image.color = fillColor.webColor;
		return fillColor;
	}
	
	/**
	 * Protected
	 */
	private var _image:Image;
	
	/**
	 * Override UIView's renderContent() to render an image at this location
	 * @param	absoluteUpperLeft	Screen coordinate to place content at.
	 * @param	absoluteSize		Bounds to render content within.
	 * @param	scale				Zoom level, for scaling images to match.
	 */
	override private function renderContent(buffer:BitmapData, absoluteUpperLeft:Point, 
											  absoluteSize:Point, scale:Float):Void
	{
		super.renderContent(buffer, absoluteUpperLeft, absoluteSize, scale);
		
		if (_image != null)
		{
			var oldScale:Float = _image.scale;
			_image.scale *= scale;
			_image.render(buffer, absoluteUpperLeft, EXTUtility.ZERO_POINT);
			_image.scale = oldScale;
		}
	}
}