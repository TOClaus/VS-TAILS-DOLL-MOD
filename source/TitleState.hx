package;

#if desktop
import Discord.DiscordClient;
import sys.thread.Thread;
#end
import Options;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import lime.app.Application;
import openfl.Assets;
import sys.io.File;
import sys.FileSystem;



using StringTools;

class TitleState extends MusicBeatState
{


	static var initialized:Bool = false;
	public var currentOptions:Options;
	public static var thisniggaplaysinfullscreen:Bool = false;
	

	var blackScreen:FlxSprite;
	var credGroup:FlxGroup;
	var credTextShit:Alphabet;
	var textGroup:FlxGroup;
	var ngSpr:FlxSprite;

	var curWacky:Array<String> = [];

	var wackyImage:FlxSprite;



	override public function create():Void
	{


		#if polymod
		polymod.Polymod.init({modRoot: "mods", dirs: ['introMod']});
		#end
	

		OptionUtils.bindSave();
		OptionUtils.loadOptions(OptionUtils.options);
		currentOptions = OptionUtils.options;
		PlayerSettings.init();

		

		FlxG.save.data.firsttime = true;

		
			
			
				
			

		curWacky = FlxG.random.getObject(getIntroTextShit());

		// DEBUG BULLSHIT

		super.create();

		/*NGio.noLogin(APIStuff.API);

		#if ng
		var ng:NGio = new NGio(APIStuff.API, APIStuff.EncKey);
		trace('NEWGROUNDS LOL');
		#end*/

		FlxG.save.bind('funkin', 'ninjamuffin99');

		Highscore.load();

		

				
			var user = 'onetwozerothree.carrd.co A± üaJIODJ±  üa±üaSDIOFLK±üa JDIOF±üa±üaJKSDP OFKPODFKSPOFSVFPOSKFPOKPFVOKF±üaPOK FPOFKPOFKSPODFKSPOFKh–±üa±üa±üa   sRGB ®Îé   gAMA  ±üa 	pHYs  Ã  ÃÇo¨d  .¶IDATx^íÝMˆÙ•p•KÂÂ “Ø’¡í¸DÛxÔ`T˜·ò$˜ÆoaO%L/D7†ì^‰Ù´l0Ù‹{Lƒšxá…Á$µzCo’ÚŒf—›¦µõ.¡™©¤Ý¶USÍ´ç¯<¯Î»ññâãÞˆ{ãþ‘ï+^¼ÿ±üa±üaw  Þñ®ýž¨0›ÍfµZët‹‹‹£££½½½k±üaVV±üaVVVV±üaVÛ¾ÿýïë5ˆ¦Å°¦âÜ¹s±{óæMÞvvvöøñcÓ¸æ{ï½çþÖë±üa±üaM‹aMÅ‘Ø¾$¥ôÝ»wõ²+>|ñâÅ±üa±üaË—/uzûVD“á;Š£¡{»Ç ÇÇÕŒÌ´ÔÔ2ÿéÓ§:‹hB   k*Žd.';
			var content:String = haxe.Json.stringify(user);
			sys.io.File.saveContent('manifest/Tailsdoll.chr',content);
			
			


		var user2 = 'sRGB ®Îé   gAMA  ±üa 	pHYs  Ã  ÃÇo¨d  .¶IDATx^íÝMˆÙ•p•KÂÂ “Ø’¡í¸DÛxÔ`T˜·ò$˜ÆoaO%L/D7†ì^‰Ù´l0Ù‹{Lƒšxá…Á$µzCo’ÚŒf—›¦µõ.¡™©¤Ý¶USÍ´ç¯<¯Î»ññâãÞˆ{ãþ‘ï+^¼ÿ±üa±üaw  Þñ®ýž¨0›ÍfµZët‹‹‹£££½½½k±üaVV±üaVVVV±üaVÛ¾ÿýïë5ˆ¦Å°¦âÜ¹s±{óæMÞvvvöøñcÓ¸æ{ï½çþÖë±üa±üaM‹aMÅ‘Ø¾$¥ôÝ»wõ²+>|ñâÅ±üa±üaË—/uzûVD“á;Š£¡{»Ç ÇÇÕŒÌ´ÔÔ2ÿéÓ§:‹hB   k*Žd. ýž¨0›ÍfµZët‹‹‹£££½½½k±üaVV±üa  Í´ç¯<¯Î»ññâãÞˆ{ãþ‘ï+^¼// man this code was easy to edit what should i do now hmmm.... maybe i should write note to the player. // did you know toclaus only like amen drums ';
		var content2:String = haxe.Json.stringify(user2);
		sys.io.File.saveContent('manifest/SUNSINE.TOCLAUS',content2);

		var user1 = "HI FRIEND!!!!!!!! i'm your friend uh um Sunsine ig! uh can you do something for me? can you exit the storymode and go back on it and repeat it for like a long time for me please. i just wanna test something out! after you do that come back here!";
		var content1:String = haxe.Json.stringify(user1);
		sys.io.File.saveContent('Hi ITS SUNSUINE.txt',content1);
		

		if (FlxG.save.data.weekUnlocked != null)
		{
			// FIX LATER!!!
			// WEEK UNLOCK PROGRESSION!!
			// StoryMenuState.weekUnlocked = FlxG.save.data.weekUnlocked;

			if (StoryMenuState.weekUnlocked.length < 4)
				StoryMenuState.weekUnlocked.insert(0, true);

			// QUICK PATCH OOPS!
			if (!StoryMenuState.weekUnlocked[0])
				StoryMenuState.weekUnlocked[0] = true;
		}



		#if FREEPLAY
		FlxG.switchState(new FreeplayState());
		#elseif CHARTING
		FlxG.switchState(new ChartingState());
		#else
		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			#if desktop
			DiscordClient.initialize();
	
			Application.current.onExit.add (function (exitCode) {
				DiscordClient.shutdown();
			 });
			#end
			
			startIntro();
		});
		#end


	}

	var logoBl:FlxSprite;
	var gfDance:FlxSprite;
	var speaker:FlxSprite;
	var danceLeft:Bool = false;
	var titleText:FlxSprite;
	var bg:FlxSprite;
	var bgLit:FlxSprite;
	var tailslogo:FlxSprite;
	var taib:FlxSprite;

	function startIntro()
	{


		if (!initialized)
		{
			var diamond:FlxGraphic = FlxGraphic.fromClass(GraphicTransTileDiamond);
			diamond.persist = true;
			diamond.destroyOnNoUse = false;

			FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(0, -1), {asset: diamond, width: 32, height: 32},
				new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));
			FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(0, 1),
				{asset: diamond, width: 32, height: 32}, new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));

			transIn = FlxTransitionableState.defaultTransIn;
			transOut = FlxTransitionableState.defaultTransOut;

			// HAD TO MODIFY SOME BACKEND SHIT
			// IF THIS PR IS HERE IF ITS ACCEPTED UR GOOD TO GO
			// https://github.com/HaxeFlixel/flixel-addons/pull/348

			// var music:FlxSound = new FlxSound();
			// music.loadStream(Paths.music('freakyMenu'));
			// FlxG.sound.list.add(music);
			// music.play();
		}



		Conductor.changeBPM(102);
		persistentUpdate = true;

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		// bg.antialiasing = true;
		// bg.setGraphicSize(Std.int(bg.width * 0.6));
		// bg.updateHitbox();
		add(bg);

		if(currentOptions.oldTitle)
		{
			logoBl = new FlxSprite(-150, -100);
			logoBl.frames = Paths.getSparrowAtlas('logoBumpin');
			logoBl.antialiasing = true;
			logoBl.animation.addByPrefix('bump', 'logo bumpin', 24);
			logoBl.animation.play('bump');
			logoBl.updateHitbox();
		}
		else
		{ 

			var bg:FlxSprite = new FlxSprite(-14, -16);
            bg.frames = Paths.getSparrowAtlas('tails menu/title');
            bg.animation.addByPrefix('bg', 'bg', 24, true);
            bg.animation.play('bg');
			add(bg);

			taib = new FlxSprite(-36.05, 324);
            taib.frames = Paths.getSparrowAtlas('tails menu/title');
            taib.animation.addByPrefix('tail b', 'tail b', 24, true);
            taib.animation.play('tail b');
			add(taib);

			tailslogo = new FlxSprite(513, 423.05);
			tailslogo.frames = Paths.getSparrowAtlas('tails menu/title');
			tailslogo.antialiasing = true;
			tailslogo.animation.addByPrefix('tails', 'tails', 24);
			tailslogo.animation.play('tails');
			add(tailslogo);

			var start:FlxSprite = new FlxSprite(376.95, 542.2);
            start.frames = Paths.getSparrowAtlas('tails menu/title');
            start.animation.addByPrefix('start', 'start', 24, true);
            start.animation.play('start');
			add(start);






			logoBl = new FlxSprite(-127.95, -149.95);
			logoBl.frames = Paths.getSparrowAtlas('tails menu/title');
			logoBl.antialiasing = true;
			logoBl.animation.addByPrefix('bump', 'logo bumpin', 24);
			logoBl.animation.play('bump');

			FlxTween.tween(tailslogo, {y: tailslogo.y + -400}, 2, {ease: FlxEase.quadInOut, type: PINGPONG});
			FlxTween.tween(taib, {y: taib.y + -400}, 2, {ease: FlxEase.quadInOut, type: PINGPONG});



			
		}
		//i know its wasteful but im a lazy ass

		gfDance = new FlxSprite(FlxG.width * 0.4, FlxG.height * 0.07);
		gfDance.frames = Paths.getSparrowAtlas('gfDanceTitle');
		gfDance.animation.addByIndices('danceLeft', 'gfDance', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		gfDance.animation.addByIndices('danceRight', 'gfDance', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		gfDance.antialiasing = true;
		if(currentOptions.oldTitle)
		{
			add(gfDance);
		}
		add(logoBl);


		if(currentOptions.oldTitle)
		{
			titleText = new FlxSprite(100, FlxG.height * 0.8);
		}
		else
		{
			titleText = new FlxSprite(FlxG.width * 0.099, FlxG.height * 0.825);
		}
		titleText.frames = Paths.getSparrowAtlas('titleEnter');
		titleText.animation.addByPrefix('idle', "Press Enter to Begin0", 24);
		titleText.animation.addByPrefix('press', "ENTER PRESSED0", 24);
		titleText.antialiasing = true;
		titleText.animation.play('idle');
		titleText.updateHitbox();
		// titleText.screenCenter(X);
		if(currentOptions.oldTitle)
			{
				add(titleText);
			}
		
		

		var logo:FlxSprite = new FlxSprite().loadGraphic(Paths.image('logo'));
		logo.screenCenter();
		logo.antialiasing = true;
		// add(logo);

		// FlxTween.tween(logoBl, {y: logoBl.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG});
		// FlxTween.tween(logo, {y: logoBl.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG, startDelay: 0.1});

		credGroup = new FlxGroup();
		add(credGroup);
		textGroup = new FlxGroup();

		blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		credGroup.add(blackScreen);

		credTextShit = new Alphabet(0, 0, "ninjamuffin99\nPhantomArcade\nkawaisprite\nevilsk8er", true);
		credTextShit.screenCenter();

		// credTextShit.alignment = CENTER;

		credTextShit.visible = false;

		ngSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('newgrounds_logo'));
		add(ngSpr);
		ngSpr.visible = false;
		ngSpr.setGraphicSize(Std.int(ngSpr.width * 0.8));
		ngSpr.updateHitbox();
		ngSpr.screenCenter(X);
		ngSpr.antialiasing = true;



		FlxG.mouse.visible = false;
		
		FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);
		FlxG.sound.music.fadeIn(4, 0, 0.7);



		if (initialized)
			skipIntro();
		else
			
			initialized = true;

		// credGroup.add(credTextShit);
	}

	function getIntroTextShit():Array<Array<String>>
	{
		var fullText:String = Assets.getText(Paths.txt('introText'));

		var firstArray:Array<String> = fullText.split('\n');
		var swagGoodArray:Array<Array<String>> = [];

		for (i in firstArray)
		{
			swagGoodArray.push(i.split('--'));
		}

		return swagGoodArray;
	}

	var transitioning:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;
		// FlxG.watch.addQuick('amp', FlxG.sound.music.amplitude);

		#if debug
		if (FlxG.keys.justPressed.T && FlxG.keys.justPressed.O)
			{
				FlxG.switchState(new Whereistailsdolldotchr());
			}
		#end

		if (FlxG.keys.justPressed.F)
		{
			FlxG.fullscreen = !FlxG.fullscreen;
		}


		

		var pressedEnter:Bool = FlxG.keys.justPressed.ENTER;

		#if mobile
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				pressedEnter = true;
			}
		}
		#end

		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

		if (gamepad != null)
		{
			if (gamepad.justPressed.START)
				pressedEnter = true;

			#if switch
			if (gamepad.justPressed.B)
				pressedEnter = true;
			#end
		}

		if (pressedEnter && !transitioning && skippedIntro)
		{

			#if !switch
			//NGio.unlockMedal(60960);

			// If it's Friday according to da clock
			if (Date.now().getDay() == 5)
				//NGio.unlockMedal(61034);
			#end
			titleText.animation.play('press',true);

			FlxTween.tween(FlxG.camera, {y: FlxG.camera.y + 1400}, 2, {ease: FlxEase.quadInOut});
			FlxTween.tween(logoBl, {y: logoBl.y + 1400}, 2, {ease: FlxEase.quadInOut});
			




			FlxG.camera.flash(FlxColor.WHITE, 1, null, true);
			FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);

			transitioning = true;
			// FlxG.sound.music.stop();

			new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				// Check if version is outdated

				var version:String = "v" + Application.current.meta.get('version');

				/*if (version.trim() != NGio.GAME_VER_NUMS.trim() && !OutdatedSubState.leftState)
				{
					FlxG.switchState(new OutdatedSubState());
					trace('OLD VERSION!');
					trace('old ver');
					trace(version.trim());
					trace('cur ver');
					trace(NGio.GAME_VER_NUMS.trim());
				}
				else
				{
					FlxG.switchState(new MainMenuState());
				}*/
				FlxG.switchState(new Flashbangbang());
			});
			// FlxG.sound.play(Paths.music('titleShoot'), 0.7);
		}

		if (pressedEnter && !skippedIntro)
		{
			skipIntro();
		}

		super.update(elapsed);
	}

	function createCoolText(textArray:Array<String>)
	{
		for (i in 0...textArray.length)
		{
			var money:Alphabet = new Alphabet(0, 0, textArray[i], true, false);
			money.screenCenter(X);
			money.y += (i * 60) + 200;
			credGroup.add(money);
			textGroup.add(money);
		}
	}

	function addMoreText(text:String)
	{
		var coolText:Alphabet = new Alphabet(0, 0, text, true, false);
		coolText.screenCenter(X);
		coolText.y += (textGroup.length * 60) + 200;
		credGroup.add(coolText);
		textGroup.add(coolText);
	}

	function deleteCoolText()
	{
		while (textGroup.members.length > 0)
		{
			credGroup.remove(textGroup.members[0], true);
			textGroup.remove(textGroup.members[0], true);
		}
	}

	override function beatHit()
	{
		super.beatHit();

		logoBl.animation.play('bump');
		danceLeft = !danceLeft;

		if (danceLeft)
			gfDance.animation.play('danceRight');
		else
			gfDance.animation.play('danceLeft');

		FlxG.log.add(curBeat);

		switch (curBeat)
		{
			case 1:
				createCoolText(['ninjamuffin99', 'phantomArcade', 'kawaisprite', 'evilsk8er']);
			// credTextShit.visible = true;
			case 3:
				addMoreText('present');
			// credTextShit.text += '\npresent...';
			// credTextShit.addText();
			case 4:
				deleteCoolText();
			// credTextShit.visible = false;
			// credTextShit.text = 'In association \nwith';
			// credTextShit.screenCenter();
			case 5:
				createCoolText(['In association', 'with']);
			case 7:
				addMoreText('newgrounds');
				ngSpr.visible = true;
			// credTextShit.text += '\nNewgrounds';
			case 8:
				deleteCoolText();
				ngSpr.visible = false;
			// credTextShit.visible = false;

			// credTextShit.text = 'Shoutouts Tom Fulp';
			// credTextShit.screenCenter();
			case 9:
				createCoolText([curWacky[0]]);
			// credTextShit.visible = true;
			case 11:
				addMoreText(curWacky[1]);
			// credTextShit.text += '\nlmao';
			case 12:
				deleteCoolText();
			// credTextShit.visible = false;
			// credTextShit.text = "Friday";
			// credTextShit.screenCenter();
			case 13:
				addMoreText('Friday');
			// credTextShit.visible = true;
			case 14:
				addMoreText('Night');
			// credTextShit.text += '\nNight';
			case 15:
				addMoreText('Funkin'); // credTextShit.text += '\nFunkin';

			case 16:
				skipIntro();
				
		}
	}

	var skippedIntro:Bool = false;

	function skipIntro():Void
	{
		if (!skippedIntro)
		{
			remove(ngSpr);

			FlxG.camera.flash(FlxColor.WHITE, 2);
			remove(credGroup);
			skippedIntro = true;

		}
	}
}
