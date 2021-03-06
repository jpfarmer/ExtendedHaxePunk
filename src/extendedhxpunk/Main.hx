package extendedhxpunk;

import com.haxepunk.Engine;
import com.haxepunk.HXP;
import com.haxepunk.RenderMode;

import extendedhxpunk.ext.EXTUtility;
import extendedhxpunk.ext.EXTConsole;
import extendedhxpunk.ext.EXTColor;
import extendedhxpunk.ext.EXTCamera;
import extendedhxpunk.ext.EXTHoverCamera;
import extendedhxpunk.ext.EXTOffsetType;
import extendedhxpunk.ext.EXTMath;
import extendedhxpunk.ext.EXTScene;

import extendedhxpunk.ui.UIView;
import extendedhxpunk.ui.UILabel;
import extendedhxpunk.ui.UITextButton;
import extendedhxpunk.ui.UIButton;
import extendedhxpunk.ui.UIViewController;
import extendedhxpunk.ui.UISmartImageStretchView;
import extendedhxpunk.ui.UISmartStretchButton;

/**
 * TODO - Eventually just take this main class out, it's not necessary.
 * TODO - Maybe write unit tests for all these classes and functions.
 * @author Jams
 */

class Main extends Engine 
{

	public static inline var kScreenWidth:Int = 640;
	public static inline var kScreenHeight:Int = 480;
	public static inline var kFrameRate:Int = 60;
	public static inline var kClearColor:Int = 0x333333;
	public static inline var kProjectName:String = "ExtendedHaXePunk";

	function new()
	{
		super(kScreenWidth, kScreenHeight, kFrameRate, false, RenderMode.HARDWARE);	
	}

	override public function init()
	{
#if debug
	#if flash
		if (flash.system.Capabilities.isDebugger)
	#end
		{
			HXP.console.enable();
		}
#end
		HXP.screen.color = kClearColor;
		HXP.screen.scale = 1;
//		HXP.world = new YourWorld();
	}

	public static function main()
	{
		var app = new Main();
	}
}