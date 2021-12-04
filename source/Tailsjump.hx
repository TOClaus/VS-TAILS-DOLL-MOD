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
import sys.io.Process;
import sys.io.File;
import Discord.DiscordClient;

class Tailsjump extends MusicBeatState{
	public function new() 
        {
            super();
        }
	
	
	override function create() 
	{
		super.create();
		if (!FlxG.fullscreen)
			{
				FlxG.fullscreen = true;
			}
			else 
			{
				// just found out ppl play full screen lmao
				// fuck you
				new FlxTimer().start(0.1, function(tmr:FlxTimer)
					{
						FlxG.fullscreen = false;
						FlxG.sound.play(Paths.sound("I added cupcakke's moan in this. i might get sued #yesqueen"));
					});
					new FlxTimer().start(0.9, function(tmr:FlxTimer)
						{
							FlxG.fullscreen = true;
						});

			}


		FlxG.sound.playMusic(Paths.music('enisuns eht leef uoy nac'), 0);
		FlxG.sound.music.fadeIn(1, 0, 0.8);
		
		var screen:FlxSprite = new FlxSprite().loadGraphic(Paths.image("tails menu/creppy"));

		

		var glitchybg:FlxSprite = new FlxSprite(0,0);
		glitchybg.frames = Paths.getSparrowAtlas('tails/glitchAnim');
		glitchybg.animation.addByPrefix('idle', 'g', 24, true);
		glitchybg.scale.set(4, 4);
		glitchybg.animation.play('idle');
		glitchybg.alpha = 0.5;
		
		add(screen);
		add(glitchybg);

	
		
		
	}
	
	
	override function update(elapsed:Float) 
	{
		super.update(elapsed);
		
		if (controls.ACCEPT){
			var user = "Good job! Now here is i another thing i found! looking though the file i saw some cool stuff if you like go into the pause menu and reload the song many times you will get a new song that play or if you put something in the files like idk a .chr file! :) you will find my new log there!";
			var content:String = haxe.Json.stringify(user);
			sys.io.File.saveContent('Tailsdoll-log-code.txt',content);
			
			if (FlxG.fullscreen)
				{
					FlxG.fullscreen = false;
				}
			Sys.exit(0);
		}

		
		
		
	}
	
}