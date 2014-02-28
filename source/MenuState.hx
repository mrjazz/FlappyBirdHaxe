package;

import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class MenuState extends FlxState
{
	override public function create():Void
	{
		FlxG.cameras.bgColor = 0xff050510;		
		
		FlxG.mouse.visible = true;
		
		var text:FlxText;
		text = new FlxText(FlxG.width / 2 - 100, FlxG.height / 3 - 30, 200, "Flappy Bird Demo");
		text.setFormat(null, 20, 0xFFFFFFFF, "center");
		add(text);
		
		text = new FlxText(FlxG.width / 2 - 100, FlxG.height / 3 + 30, 200, "by Denis Sheremetov");
		text.setFormat(null, 8, 0xFFFFFFFF, "center");
		add(text);
		
		var startButton:FlxButton = new FlxButton(FlxG.width / 2 - 40, FlxG.height / 3 + 64, "Play", onPlay);
		startButton.color = 0x666699;
		startButton.label.color = 0xFFFFFFFF;
		add(startButton);
	}
	
	private function onPlay():Void
	{
		FlxG.switchState(new PlayState());
	}
}