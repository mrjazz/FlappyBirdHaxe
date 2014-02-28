package;

import flash.display.BitmapData;
import flash.geom.Matrix;
import flash.Lib;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;

class Gate extends FlxSprite
{
	
	private var MOVEMENT_SPEED:Int = 2;
	private var delay: Int = 0;	
	private var player: Player;
	
	public function new(player: Player, height: Int, top: Bool)
	{
		var X: Int;
		var Y: Int;
		
		if (top) {
			X = GameClass.WIDTH - 10;
			Y = -320 + height;
		} else {
			X = GameClass.WIDTH - 10;
			Y = GameClass.HEIGHT - height + 10;			
		}
		super(X, Y);
		
		if (top) {
			loadGraphic(Reg.GATE_TOP, false, false, 52, 320);		
		} else {
			loadGraphic(Reg.GATE, false, false, 52, height);
		}
			
		
		//makeGraphic(10, height, 0xffff4040);		
		this.player = player;
	}
	
	override public function update() : Void
	{
		super.update();					
		x -= 1;				
		if (x <= -width) {		
			destroy();
		}		
		
		if (y < 0 && x == 20) {			
			player.incScore();
			flash.Lib.trace("Score: " + player.getScore());
		}
		FlxG.overlap(player, this, stuffHitStuff); 
		
	}	
	
	private function stuffHitStuff(Object1:FlxObject, Object2:FlxObject):Void
	{
		Object1.kill();
		Object2.kill();
		
		FlxG.switchState(new MenuState());
		
	} 
	
	
}
