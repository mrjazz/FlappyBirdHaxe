package;
 
import flash.Lib;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
 
/**
 * ...
 * @author .:BuzzJeux:.
 */
class PlayState extends FlxState
{
	
	private var playerGroup: FlxGroup;
	public var player: Player;		
	
	static private inline var NEW_GATE_DELAY: Int = 200;
	
	private var timeout: Int = 0;
	private var scoreText:FlxText;	
	
	override public function create():Void
	{
		FlxG.mouse.visible = false;		
		FlxG.cameras.bgColor = 0xff4EC0CA; 
				
		
		playerGroup = new FlxGroup();
		add(playerGroup);
		
		player = new Player(80, 50);		
		playerGroup.add(player);	
		
		scoreText = new FlxText(2, 2, 80, "");
		scoreText.setFormat(null, 8, FlxColor.WHITE, null, FlxText.BORDER_NONE, FlxColor.BLACK);
		add(scoreText);
		
	}
	
	override public function update():Void
	{
		super.update();
		
		if (timeout-- <= 0) {
			timeout = NEW_GATE_DELAY;
			createGate();
		}
		
		scoreText.text = "SCORE: " + player.getScore();				
		
		//trace("1");
		//Lib.trace("2");		
	}
	
	override public function destroy():Void
	{
		super.destroy();
		
		player = null;		
	}
	
	function createGate():Void 
	{
		var maxHeight: Int = GameClass.HEIGHT;
		var gap: Int = Math.round(maxHeight * 0.4);
		var gateHeight: Int = Math.round(maxHeight * 0.15);
		
		var gatewayPoint: Int = Math.round(Math.random() * (maxHeight - gap)) + Math.round(gap / 2);
		
		var h1: Int = gatewayPoint - gateHeight;
		var h2: Int = maxHeight - gatewayPoint - gateHeight;
		
		var gate1 = new Gate(player, h1, true);
		var gate2 = new Gate(player, h2, false);		
		
		playerGroup.add(gate1);
		playerGroup.add(gate2);
	}
}
