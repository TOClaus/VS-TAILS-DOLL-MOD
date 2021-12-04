package;

import flixel.FlxG;
import flixel.FlxSprite;

class NoteSplash extends FlxSprite
{
	public function new(?fromNote:Int = 0, x:Float, y:Float)
	{
		super(x, y);

		frames = Paths.getSparrowAtlas('noteSplashes');

		animation.addByPrefix('note1-0', 'note splash blue 1', 24, false);
		animation.addByPrefix('note2-0', 'note splash green 1', 24, false);
		animation.addByPrefix('note0-0', 'note splash purple 1', 24, false);
		animation.addByPrefix('note3-0', 'note splash red 1', 24, false);
		animation.addByPrefix('note1-1', 'note splash blue 2', 24, false);
		animation.addByPrefix('note2-1', 'note splash green 2', 24, false);
		animation.addByPrefix('note0-1', 'note splash purple 2', 24, false);
		animation.addByPrefix('note3-1', 'note splash red 2', 24, false);

		setupNoteSplash(x, y, fromNote);
	}

	public function setupNoteSplash(x:Float, y:Float, noteData:Int = 0)
	{
		setPosition(x, y);
		alpha = 0.6;


		animation.play("note" + noteData + "-" + FlxG.random.int(0, 1), true);
		animation.finishCallback = function(name) kill();

		animation.curAnim.frameRate = 24 + FlxG.random.int(-2, 2);
		updateHitbox();

		offset.set(width * 0.3, height * 0.3);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}