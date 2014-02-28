package;

import flash.Lib;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;

class Background extends FlxSprite
{
	
	private var MOVEMENT_SPEED:Int = 2;
	private var delay: Int = 0;		
	
	public function new(X: Int)
	{				
		super(X, 0);							
		loadGraphic(Reg.BACKGROUND);		
	}
	
	override public function update() : Void
	{
		super.update();					
		x -= 1;				
		if (x <= -width) {		
			destroy();
		}		
	}	
	
	private function stuffHitStuff(Object1:FlxObject, Object2:FlxObject):Void
	{
		Object1.kill();
		Object2.kill();
		
		FlxG.switchState(new MenuState());
		
	} 
	
	
}
