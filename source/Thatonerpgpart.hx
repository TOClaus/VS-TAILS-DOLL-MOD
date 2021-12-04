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
import flixel.*;
import flixel.input.keyboard.FlxKey;
import haxe.Exception;
import openfl.geom.Matrix;
import Discord.DiscordClient;
import openfl.display.BitmapData;
import openfl.utils.AssetType;
import lime.graphics.Image;
import flixel.graphics.FlxGraphic;
import openfl.utils.AssetManifest;
import openfl.utils.AssetLibrary;
import flixel.system.FlxAssets;
class Thatonerpgpart extends MusicBeatState
{

    override public function create()
         {
            super.create();
            FlxG.sound.playMusic(Paths.music('bs_distance'), 0);
            FlxG.sound.music.fadeIn(1, 0, 0.8);

            var bg:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('tails menu/!parallax_glitch'));
            bg.antialiasing = true;
            bg.active = true;
            bg.setGraphicSize(Std.int(bg.width * 7));
            bg.updateHitbox();
            FlxTween.tween(bg, {y: bg.y + 40}, 2, {ease: FlxEase.quadInOut, type: PINGPONG});

            var sun:FlxSprite = new FlxSprite(568, 272);
            sun.frames = Paths.getSparrowAtlas('tails menu/mysunsine');
            sun.animation.addByPrefix('sunsine', 'sunsine', 24, true);
            sun.animation.play('sunsine');

            var pc:FlxSprite = new FlxSprite(458.5, 363.5);
            pc.frames = Paths.getSparrowAtlas('tails menu/mysunsine');
            pc.animation.addByPrefix('laptop', 'laptop', 24, true);
            pc.animation.play('laptop');

            var tails:FlxSprite = new FlxSprite(397.45, 441);
            tails.frames = Paths.getSparrowAtlas('tails menu/mysunsine');
            tails.animation.addByPrefix('tails dool', 'tails dool', 24, true);
            tails.animation.play('tails dool');

            var knife:FlxSprite = new FlxSprite(454.5, 504);
            knife.frames = Paths.getSparrowAtlas('tails menu/mysunsine');
            knife.animation.addByPrefix('knife', 'knife', 24, true);
            knife.animation.play('knife');

            var stuffin:FlxSprite = new FlxSprite(536, 468);
            stuffin.frames = Paths.getSparrowAtlas('tails menu/mysunsine');
            stuffin.animation.addByPrefix('stuffin', 'stuffin', 24, true);
            stuffin.animation.play('stuffin');

            add(bg);
            add(stuffin);
            add(knife);
            add(tails);
            add(pc);
            add(sun);
            

            new FlxTimer().start(19, function(e:FlxTimer)
               {
                  var text = "Whoa you found my room! i just started to working on this menu hehe! maybe in the next update it will be done :3 ";
                  var context:String = haxe.Json.stringify(text);
                  sys.io.File.saveContent('YOU FOUND ME.txt',context);
                  Sys.exit(0);
               });

             
            
           
            


        
         }

      override function update(elapsed:Float) 
       {
            super.update(elapsed);
               
             if (controls.ACCEPT){
                  var text = "Whoa you found my room! i just started to working on this menu hehe! maybe in the next update it will be done :3 ";
                  var context:String = haxe.Json.stringify(text);
                  sys.io.File.saveContent('YOU FOUND ME.txt',context);
                  Sys.exit(0);
               }
         
               
               
               
       }










}