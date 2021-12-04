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

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;
	var player2:FlxSprite;
	var player1:FlxSprite;
	var player3:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		var hdbox = false;
		if (hdbox = true)
			{
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('tails/text');
				box.animation.addByPrefix('normalOpen', 'text', 24, false);
				box.animation.addByPrefix('normal', 'text', 24, false);
				box.x -=  133.4;
				box.y -=  -350;
				box.scrollFactor.set(4,4);
				box.screenCenter(X);
			}

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'battery':
				hdbox = true;	
			case 'robots':
				hdbox = true;	
			case 'hard-metal':
				hdbox = true;				

			case 'senpai':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
				box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
				box.screenCenter(X);
			case 'roses':
				hasDialog = true;
				FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX'));

				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-senpaiMad');
				box.animation.addByPrefix('normalOpen', 'SENPAI ANGRY IMPACT SPEECH', 24, false);
				box.animation.addByIndices('normal', 'SENPAI ANGRY IMPACT SPEECH', [4], "", 24);
				box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
				box.screenCenter(X);

			case 'thorns':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [11], "", 24);
				box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
				box.screenCenter(X);

				var face:FlxSprite = new FlxSprite(320, 170).loadGraphic(Paths.image('weeb/spiritFaceForward'));
				face.setGraphicSize(Std.int(face.width * 6));
				add(face);
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		portraitLeft = new FlxSprite(-20, 40);
		portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiPortrait');
		portraitLeft.animation.addByPrefix('enter', 'Senpai Portrait Enter', 24, false);
		portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
		portraitLeft.updateHitbox();
		portraitLeft.scrollFactor.set();
		add(portraitLeft);
		portraitLeft.visible = false;

		portraitRight = new FlxSprite(0, 40);
		portraitRight.frames = Paths.getSparrowAtlas('weeb/bfPortrait');
		portraitRight.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
		portraitRight.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.9));
		portraitRight.updateHitbox();
		portraitRight.scrollFactor.set();
		add(portraitRight);
		portraitRight.visible = false;


		player1 = new FlxSprite(815.1, 151.35);
		player1.frames = Paths.getSparrowAtlas('tails/text');
		player1.updateHitbox();
		player1.scrollFactor.set(4,4);
		add(player1);
		player1.visible = false;

		player2 = new FlxSprite(160.45, 147.9);
		player2.frames = Paths.getSparrowAtlas('tails/text');
		player2.updateHitbox();
		player2.scrollFactor.set(4,4);
		add(player2);
		player2.visible = false;

		player3 = new FlxSprite(488, 151.4);
		player3.frames = Paths.getSparrowAtlas('tails/text');
		player3.updateHitbox();
		player3.scrollFactor.set(4,4);
		add(player3);
		player3.visible = false;

		
		
		box.animation.play('normalOpen');
		box.updateHitbox();
		add(box);

		box.screenCenter(X);
		portraitLeft.screenCenter(X);




		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'Pixel Arial 11 Bold';
		dropText.color = 0xFFD89494;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = 'Pixel Arial 11 Bold';
		swagDialogue.color = 0xFF3F2021;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'roses')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}

		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						portraitLeft.visible = false;
						portraitRight.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{  
			// -------------------sound && effects------------------------------------------------------------------------------
			case 'player2-msonic-shake':
				player3.visible = false;
				player1.visible = false;
				player2.animation.addByPrefix('enter', 'msonic0', 24, false);
				if (!player2.visible)
				{

					FlxG.camera.shake(0.05);
					player2.visible = true;
					player2.animation.play('enter');
				} 

			case 'player3-tails-beep':
				player2.visible = false;
				player1.visible = false;
				player3.animation.addByPrefix('enter', 'tails0', 24, false);
				if (!player3.visible)
				{
					FlxG.sound.play(Paths.sound('GF_2'));
					player3.visible = true;
					player3.animation.play('enter');
				}
			
			// -------------------noone------------------------------------------------------------------------------
			case 'noone':
				player3.visible = false;
				player2.visible = false;
				player1.visible = false;

			// -------------------knk------------------------------------------------------------------------------
			case 'player3-mkuk':
				player2.visible = false;
				player1.visible = false;
				player3.animation.addByPrefix('enter', 'mkuk0', 24, false);
				if (!player3.visible)
				{
					
					player3.visible = true;
					player3.animation.play('enter');
				}

			case 'player2-mkuk':
				player3.visible = false;
				player1.visible = false;
				player2.animation.addByPrefix('enter', 'mkuk0', 24, false);
				if (!player2.visible)
				{
					
					player2.visible = true;
					player2.animation.play('enter');
				}
			case 'player1-mkuk':
				player2.visible = false;
				player3.visible = false;
				player1.animation.addByPrefix('enter', 'mkuk0', 24, false);
				if (!player1.visible)
				{
					player1.flipX = true;
					player1.visible = true;
					player1.animation.play('enter');
				}
			// -------------------sonic------------------------------------------------------------------------------
			case 'player3-msonic':
				player2.visible = false;
				player1.visible = false;
				player3.animation.addByPrefix('enter', 'msonic0', 24, false);
				if (!player3.visible)
				{
					
					player3.visible = true;
					player3.animation.play('enter');
				}

			case 'player2-msonic':
				player3.visible = false;
				player1.visible = false;
				player2.animation.addByPrefix('enter', 'msonic0', 24, false);
				if (!player2.visible)
				{
					
					player2.visible = true;
					player2.animation.play('enter');
				}
			case 'player1-msonic':
				player2.visible = false;
				player3.visible = false;
				player1.animation.addByPrefix('enter', 'msonic0', 24, false);
				if (!player1.visible)
				{
					player1.flipX = true;
					player1.visible = true;
					player1.animation.play('enter');
				}
			// -------------------gf------------------------------------------------------------------------------
			case 'player3-gf':
				player2.visible = false;
				player1.visible = false;
				player3.animation.addByPrefix('enter', 'gf0', 24, false);
				if (!player3.visible)
				{
					
					player3.visible = true;
					player3.animation.play('enter');
				}

			case 'player2-gf':
				player3.visible = false;
				player1.visible = false;
				player2.animation.addByPrefix('enter', 'gf0', 24, false);
				if (!player2.visible)
				{
					
					player2.visible = true;
					player2.animation.play('enter');
				}
			case 'player1-gf':
				player2.visible = false;
				player3.visible = false;
				player1.animation.addByPrefix('enter', 'gf0', 24, false);
				if (!player1.visible)
				{
					player1.flipX = false;
					player1.visible = true;
					player1.animation.play('enter');
				}
			
			// -------------------bf------------------------------------------------------------------------------
			case 'player3-bf':
				player2.visible = false;
				player1.visible = false;
				player3.animation.addByPrefix('enter', 'bf0', 24, false);
				if (!player3.visible)
				{
					
					player3.visible = true;
					player3.animation.play('enter');
				}

			case 'player2-bf':
				player3.visible = false;
				player1.visible = false;
				player2.animation.addByPrefix('enter', 'bf0', 24, false);
				if (!player2.visible)
				{
					
					player2.visible = true;
					player2.animation.play('enter');
				}
			case 'player1-bf':
				player2.visible = false;
				player3.visible = false;
				player1.animation.addByPrefix('enter', 'bf0', 24, false);
				if (!player1.visible)
				{
					
					player1.flipX = false;
					player1.visible = true;
					player1.animation.play('enter');
				}
			// -------------------tails---------------------------------------------------------------------------
			case 'player3-tails':
				player2.visible = false;
				player1.visible = false;
				player3.animation.addByPrefix('enter', 'tails0', 24, false);
				if (!player3.visible)
				{
					
					player3.visible = true;
					player3.animation.play('enter');
				}

			case 'player2-tails':
				player3.visible = false;
				player1.visible = false;
				player2.animation.addByPrefix('enter', 'tails0', 24, false);
				if (!player2.visible)
				{
					
					player2.visible = true;
					player2.animation.play('enter');
				}
			case 'player1-tails':
				player2.visible = false;
				player3.visible = false;
				player1.animation.addByPrefix('enter', 'tails0', 24, false);
				if (!player1.visible)
				{
					player1.flipX = true;
					player1.visible = true;
					player1.animation.play('enter');
				}
			// ---------------------------------------------------defult-----------------
			case 'dad':
				portraitRight.visible = false;
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'bf':
				portraitLeft.visible = false;
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
