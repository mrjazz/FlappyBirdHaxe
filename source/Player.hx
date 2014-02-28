package;

import flash.Lib;
import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite
{
	
	private var MOVEMENT_SPEED:Int = 2;
	private var delay: Int = 0;	
	private var score: Int = 0;	
	
	public function new(X:Int, Y:Int) 
	{
		super(X, Y);
		//makeGraphic(10, 10, 0xffc04040);	
		loadGraphic(Reg.BIRD, true, true, 35, 24);		
		animation.add("fly", [1, 2, 3], 10, true); 
		animation.play("fly"); 
	}
	
	override public function update() : Void
	{
		super.update();
		
		if (FlxG.mouse.justPressed) {			
			jump();
		}
		
		if (--delay <= 0 ) {		
			y -= MOVEMENT_SPEED--;
			delay = 2;
		}
		
		if (GameClass.HEIGHT - height < y) {
			y = GameClass.HEIGHT - height;
			//FlxG.switchState(new MenuState()); // game over
		}
		
		//flash.Lib.trace(y + " : " + GameClass.HEIGHT);
		
	}	
	
	public function getScore(): Int {
		return score;
	}
	
	public function incScore(): Void {
		score++;
	}
	
	private function jump(): Void {
		MOVEMENT_SPEED = 7;
	}
	
}
