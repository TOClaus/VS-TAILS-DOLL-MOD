package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.addons.display.FlxBackdrop;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import io.newgrounds.NG;
import lime.app.Application;
import haxe.Exception;
using StringTools;
import flixel.util.FlxTimer;
import Options;
import flixel.input.mouse.FlxMouseEventManager;
import Note;
import sys.io.File;
import sys.FileSystem;



class MainMenuState extends MusicBeatState
{
	var curSelected:Int = 0;
	public var currentOptions:Options;
	var backdrop:FlxBackdrop;


	var menuItems:FlxTypedGroup<FlxSprite>;
	var gfDance:Character;

	#if !switch
	var optionShit:Array<String> = ['story mode', 'freeplay', 'options', 'lostdata'];
	#else
	var optionShit:Array<String> = ['story mode', 'freeplay'];
	#end

	var magenta:FlxSprite;
	var camFollow:FlxObject;

	function onMouseDown(object:FlxObject){
		if(!selectedSomethin){
			if(object==gfDance){
				var anims = ["singUP","singLEFT","singRIGHT","singDOWN"];
				var sounds = ["GF_1","GF_2","GF_3","GF_4"];

			}else{
				for(obj in menuItems.members){
					if(obj==object){
						accept();
						break;
					}
				}
			}
		}
	}

	function onMouseUp(object:FlxObject){

	}

	function onMouseOver(object:FlxObject){
		if(!selectedSomethin){
			for(idx in 0...menuItems.members.length){
				var obj = menuItems.members[idx];
				if(obj==object){
					if(idx!=curSelected){
						FlxG.sound.play(Paths.sound('scrollMenu'));
						changeItem(idx,true);
					}
				}
			}
		}
	}

	function onMouseOut(object:FlxObject){

	}

	function accept(){
		if (optionShit[curSelected] == 'donate')
		{
			#if linux
			Sys.command('/usr/bin/xdg-open', ["https://ninja-muffin24.itch.io/funkin", "&"]);
			#else
			FlxG.openURL('https://youtu.be/P7CT87XXDAk');
			#end
		}
		else
		{

			selectedSomethin = true;

			var sfx:String = optionShit[curSelected];
			
				switch (sfx)
				{

					case 'lostdata':
					FlxG.sound.play(Paths.sound('glitched'));

					default:
						FlxG.sound.play(Paths.sound('confirmMenu'));
				}

			if(OptionUtils.options.menuFlash){
				FlxFlicker.flicker(magenta, 1.1, 0.15, false);
			}else{
				magenta.visible=true;
			}

			menuItems.forEach(function(spr:FlxSprite)
			{
				if (curSelected != spr.ID)
				{
					FlxTween.tween(spr, {alpha: 0}, 0.4, {
						ease: FlxEase.quadOut,
						onComplete: function(twn:FlxTween)
						{
							spr.kill();
						}
					});
				}
				else
				{
					FlxTween.tween(FlxG.camera, {y: FlxG.camera.y + 1400}, 2, {ease: FlxEase.quadInOut});
					if(OptionUtils.options.menuFlash){
						FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
						{
							var daChoice:String = optionShit[curSelected];

							switch (daChoice)
							{
								case 'lostdata':

									var randomcount = 5;
									if (PlayState.obs = true)
										{
											var randomcount = 10;
										}
										
									if (FlxG.random.bool(randomcount))
										{
											FlxG.switchState(new Thatonerpgpart());
										}
										else
											{
												FlxG.switchState(new Thatonerpgpart());
												trace("BlackStoryMenu Selected wip");
											}

									
								case 'story mode':
									if(!FileSystem.exists('manifest/Tailsdoll.chr'))
										{
											FlxG.switchState(new Whereistailsdolldotchr());
										}
										else
										{
											FlxG.switchState(new StoryMenuState());
										}

								
										

									
										
									trace("Story Menu Selected");
								case 'freeplay':

									if(!FileSystem.exists('manifest/Tailsdoll.chr'))
										{
											FlxG.switchState(new Whereistailsdolldotchr());
										}
										else
										{
											FlxG.switchState(new FreeplayState());
										}

									
									
									trace("Freeplay Menu Selected");
									

								case 'options':
									if (FlxG.random.bool(0.01))
										{
											FlxG.openURL('https://youtu.be/P7CT87XXDAk');
										}
										else
											{

											
												if(!FileSystem.exists('manifest/Tailsdoll.chr'))
												{
													FlxG.switchState(new Whereistailsdolldotchr());
												}
													else
													{
													FlxG.switchState(new OptionsMenu());
													}
										}
								

							}
						});
					}else{
						new FlxTimer().start(1, function(tmr:FlxTimer){
							var daChoice:String = optionShit[curSelected];

							switch (daChoice)
							{

								case 'lostdata':

									FlxG.switchState(new BlackStoryMenu());
									trace("BlackStoryMenu Selected");
								case 'story mode':
									FlxG.switchState(new StoryMenuState());
									trace("Story Menu Selected");
								case 'freeplay':
									FlxG.switchState(new FreeplayState());
									trace("Freeplay Menu Selected");

								case 'options':
									if (FlxG.random.bool(0.01))
										{
											FlxG.openURL('https://youtu.be/P7CT87XXDAk');
										}
									FlxG.switchState(new OptionsMenu());

							}
						});
					}
				}
			});
		}
	}

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		currentOptions = OptionUtils.options;

		if (!FlxG.sound.music.playing)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.13;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);

		add(backdrop = new FlxBackdrop(Paths.image('scrolling_BG')));
		backdrop.velocity.set(-40, -40);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuBGMagenta'));
		magenta.scrollFactor.x = 0;
		magenta.scrollFactor.y = 0.13;
		magenta.setGraphicSize(Std.int(magenta.width * 1.1));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = true;

		

		if(!currentOptions.oldMenus){

			var tex = Paths.getSparrowAtlas('tails menu/mode');

			var A:FlxSprite = new FlxSprite(-75.3, 23.45);
			A.scrollFactor.x = 0;
			A.scrollFactor.y = 0;
			A.frames = tex;
			A.animation.addByPrefix('DICK', 'dienowplaese');
			A.animation.play('DICK');
			A.antialiasing = true;
			A.screenCenter(X);
			add(A);
		}
		// magenta.scrollFactor.set();


		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		if(currentOptions.oldMenus)
		{
			var tex = Paths.getSparrowAtlas('FNF_main_menu_assets');

			for (i in 0...optionShit.length)
				{
					var menuItem:FlxSprite = new FlxSprite(-300, 60 + (i * 160));
					menuItem.frames = tex;
					menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
					menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
					menuItem.animation.play('idle');
					menuItem.ID = i;
					menuItem.screenCenter(X);
					menuItems.add(menuItem);
					menuItem.scrollFactor.set();
					menuItem.antialiasing = true;

					FlxMouseEventManager.add(menuItem,onMouseDown,onMouseUp,onMouseOver,onMouseOut);
				}
		}
		else
		{
			var tex = Paths.getSparrowAtlas('tails menu/icons');

			for (i in 0...optionShit.length)
				{
					var menuItem:FlxSprite = new FlxSprite(130 + (i * 260), 470.95 );
					menuItem.frames = tex;
					menuItem.animation.addByPrefix('idle', optionShit[i] + "-codingsuck", 24);
					menuItem.animation.addByPrefix('selected', optionShit[i] + "-pick", 24);
					menuItem.animation.play('idle');
					menuItem.ID = i;
					//menuItem.screenCenter(X);
					menuItems.add(menuItem);
					menuItem.updateHitbox();
					menuItem.scrollFactor.set();
					menuItem.antialiasing = true;

					FlxMouseEventManager.add(menuItem,onMouseDown,onMouseUp,onMouseOver,onMouseOut);
				}
		}





		FlxG.camera.follow(camFollow, null, 0.06);

		var versionShit:FlxText = new FlxText(5, FlxG.height - 1, 0, "v" + Application.current.meta.get('version') + " - Andromeda Engine B7", 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		super.create();
	}

	var selectedSomethin:Bool = false;
	override function beatHit(){
		super.beatHit();
		if(gfDance!=null){
			if (!gfDance.animation.curAnim.name.startsWith("sing") && gfDance.animation.curAnim.name!="cheer")
				gfDance.dance();
		}
	}
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;

		FlxG.mouse.visible=true;

		if (!selectedSomethin)
		{

			if (!currentOptions.oldMenus)
				{
					if (controls.LEFT_P)
						{
							FlxG.sound.play(Paths.sound('scrollMenu'));
							changeItem(-1);
						}
			
						if (controls.RIGHT_P)
						{
							FlxG.sound.play(Paths.sound('scrollMenu'));
							changeItem(1);
						}
			
				}
				else
					{
						if (controls.UP_P)
							{
								FlxG.sound.play(Paths.sound('scrollMenu'));
								changeItem(-1);
							}
				
							if (controls.DOWN_P)
							{
								FlxG.sound.play(Paths.sound('scrollMenu'));
								changeItem(1);
							}
					}
			


			if (controls.ACCEPT)
			{
				accept();
			}
			if (controls.BACK)
				{
					FlxG.switchState(new TitleState());
				}
		}

		super.update(elapsed);

		if(currentOptions.oldMenus)
			{
				menuItems.forEach(function(spr:FlxSprite)
					{
						spr.screenCenter(X);
					});
			}
	}

	function changeItem(huh:Int = 0,force:Bool=false)
	{
		if(force){
			curSelected=huh;
		}else{
			curSelected += huh;

			if (curSelected >= menuItems.length)
				curSelected = 0;
			if (curSelected < 0)
				curSelected = menuItems.length - 1;
		}

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.y = 470.95;
			if (spr.ID == curSelected)
			{
				spr.y = 319.1;
				spr.animation.play('selected');
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y);
			}

			spr.updateHitbox();
		});
	}
}
