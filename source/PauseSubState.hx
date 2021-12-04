package;

import Controls.Control;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;

class PauseSubState extends MusicBeatSubstate
{
	var grpMenuShit:FlxTypedGroup<Alphabet>;

	var menuItems:Array<String> = ['Resume', 'Restart Song', 'Exit to menu'];
	var curSelected:Int = 0;

	var pauseMusic:FlxSound;
	public var botPlay:Bool = false;

	

	public function new(x:Float, y:Float)
	{
		super();






		
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0;
		bg.scrollFactor.set();
		add(bg);

		if (FlxG.random.bool(4))
			{

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

				bg.alpha = 1;
				var glitchybg:FlxSprite = new FlxSprite(0,0);
				glitchybg.frames = Paths.getSparrowAtlas('tails/glitchAnim');
				glitchybg.animation.addByPrefix('idle', 'g', 24, true);
				glitchybg.scale.set(4, 4);
				glitchybg.animation.play('idle');
				glitchybg.alpha = 0.5;
				add(glitchybg);

				pauseMusic = new FlxSound().loadEmbedded(Paths.music('bs_loop2'), true, true);
				pauseMusic.volume = 50;
				pauseMusic.play(false, FlxG.random.int(0, Std.int(pauseMusic.length / 100)));
				
				FlxTween.tween(bg, {alpha: 1}, 0, {ease: FlxEase.quartInOut});
			}
			else
				{
					pauseMusic = new FlxSound().loadEmbedded(Paths.music('breakfast'), true, true);
					pauseMusic.volume = 50;
					pauseMusic.play(false, FlxG.random.int(0, Std.int(pauseMusic.length / 100)));
					FlxTween.tween(bg, {alpha: 0.6}, 0.4, {ease: FlxEase.quartInOut});
				}

				FlxG.sound.list.add(pauseMusic);



		var levelInfo:FlxText = new FlxText(20, 15, 0, "", 32);
		levelInfo.text += PlayState.SONG.song;
		levelInfo.scrollFactor.set();
		levelInfo.setFormat(Paths.font("vcr.ttf"), 32);
		levelInfo.updateHitbox();
		add(levelInfo);

		var levelDifficulty:FlxText = new FlxText(20, 15 + 32, 0, "", 32);
		levelDifficulty.text += CoolUtil.difficultyString();
		levelDifficulty.scrollFactor.set();
		levelDifficulty.setFormat(Paths.font('vcr.ttf'), 32);
		levelDifficulty.updateHitbox();
		add(levelDifficulty);

		levelDifficulty.alpha = 0;
		levelInfo.alpha = 0;

		levelInfo.x = FlxG.width - (levelInfo.width + 20);
		levelDifficulty.x = FlxG.width - (levelDifficulty.width + 20);

		
		FlxTween.tween(levelInfo, {alpha: 1, y: 20}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.3});
		FlxTween.tween(levelDifficulty, {alpha: 1, y: levelDifficulty.y + 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.5});

		grpMenuShit = new FlxTypedGroup<Alphabet>();
		add(grpMenuShit);

		for (i in 0...menuItems.length)
		{
			var songText:Alphabet = new Alphabet(0, (70 * i) + 30, menuItems[i], true, false);
			songText.isMenuItem = true;
			songText.targetY = i;
			grpMenuShit.add(songText);
		}

		changeSelection();

		cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];
	}

	override function update(elapsed:Float)
	{
		if (pauseMusic.volume < 0.5)
			pauseMusic.volume += 0.01 * elapsed;

		super.update(elapsed);

		var upP = controls.UP_P;
		var downP = controls.DOWN_P;
		var accepted = controls.ACCEPT;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}

		if (accepted)
		{
			var daSelected:String = menuItems[curSelected];

			switch (daSelected)
			{



				case "Resume":
					if (!TitleState.thisniggaplaysinfullscreen)
						{
							FlxG.fullscreen = false;
						}

						
						
				close();
						
					
					
				case "Restart Song":
					FlxTween.tween(FlxG.camera, {y: FlxG.camera.y + 1400}, 2, {ease: FlxEase.quadInOut});
					var randomcount = 7;
					if (PlayState.obs = true)
						{
							var randomcount = 15;
						}
						
					if (FlxG.random.bool(randomcount))
						{
							var difficulty = '-hard';
							PlayState.SONG = Song.loadFromJson('epiphany' + difficulty, 'epiphany');
						}
						if (!TitleState.thisniggaplaysinfullscreen)
							{
								FlxG.fullscreen = false;
							}
					FlxG.resetState();

				case "Exit to menu":
					FlxTween.tween(FlxG.camera, {y: FlxG.camera.y + 1400}, 2, {ease: FlxEase.quadInOut});
					if (!TitleState.thisniggaplaysinfullscreen)
						{
							FlxG.fullscreen = false;
						}
					FlxG.switchState(new MainMenuState());
					Cache.Clear();
			}
		}

		if (FlxG.keys.justPressed.J)
		{
			// for reference later!
			// PlayerSettings.player1.controls.replaceBinding(Control.LEFT, Keys, FlxKey.J, null);
		}
	}

	override function destroy()
	{
		pauseMusic.destroy();

		super.destroy();
	}

	function changeSelection(change:Int = 0):Void
	{
		curSelected += change;

		if (curSelected < 0)
			curSelected = menuItems.length - 1;
		if (curSelected >= menuItems.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpMenuShit.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
	}
}