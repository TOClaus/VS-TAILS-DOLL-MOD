package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;


class Flashbangbang extends MusicBeatState{
	public function new() 
        {
            super();
        }
	
	
	override function create() 
	{
		super.create();
		FlxG.camera.y = 1400;
		FlxTween.tween(FlxG.camera, {y: FlxG.camera.y = 0}, 2, {ease: FlxEase.quadInOut});
		
		var screen:FlxSprite = new FlxSprite().loadGraphic(Paths.image("tails menu/flash"));

		add(screen);

		var randomcount = 30;
		if (PlayState.obs = true)
			{
				var randomcount = 40;
			}
			
		if (FlxG.random.bool(randomcount))
			{
				new FlxTimer().start(0.1, function(tmr:FlxTimer)
					{
						remove(screen);
						var screen:FlxSprite = new FlxSprite().loadGraphic(Paths.image("tails menu/flashalt"));
						add(screen);
					});
					new FlxTimer().start(1, function(tmr:FlxTimer)
						{
							remove(screen);
							var screen:FlxSprite = new FlxSprite().loadGraphic(Paths.image("tails menu/flashaltglitched"));
							add(screen);
						});
						new FlxTimer().start(1.9, function(tmr:FlxTimer)
							{
								remove(screen);
								var screen:FlxSprite = new FlxSprite().loadGraphic(Paths.image("tails menu/flash"));
								add(screen);
							});

					
			}
		
		
		
		
		
	}
	
	
	override function update(elapsed:Float) 
	{
		super.update(elapsed);
		
		if (controls.ACCEPT){
			FlxG.switchState(new MainMenuState());
		}

		
		
		
	}
	
}