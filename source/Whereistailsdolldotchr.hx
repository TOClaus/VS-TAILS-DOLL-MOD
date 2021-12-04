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
import flixel.*;
import flixel.addons.ui.FlxUIText;
import Song.SwagSong;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
class Whereistailsdolldotchr extends MusicBeatState
{

    override public function create()
        {

            FlxG.sound.playMusic(Paths.music('blackmenu'));

            var sunietext:FlxText;
            sunietext = new FlxUIText(532,550, 0, "");
            sunietext.setFormat("Arial", 30, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);

            var tailstext:FlxText;
            tailstext = new FlxUIText(532,550, 0, "");
            tailstext.setFormat("CholesterolGlitch-1GzmL Arial 15 Bold", 30, FlxColor.RED, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
            var screen:FlxSprite = new FlxSprite().loadGraphic(Paths.image("tails menu/creppy"));
            screen.alpha = 0.1;
            var glitchybg:FlxSprite = new FlxSprite(0,0);
            glitchybg.frames = Paths.getSparrowAtlas('tails/glitchAnim');
            glitchybg.animation.addByPrefix('idle', 'g', 24, true);
            glitchybg.scale.set(4, 4);
            glitchybg.animation.play('idle');
            glitchybg.alpha = 0.2;

            new FlxTimer().start(4, function(deadTime:FlxTimer)
                {

                    add(sunietext);
                    sunietext.text = "Y-you did it!";
                    new FlxTimer().start(2, function(deadTime:FlxTimer)
                        {
                            remove(sunietext);
                            add(sunietext);
                            sunietext.text = "You delete the virus";
                            new FlxTimer().start(2, function(deadTime:FlxTimer)
                                {
                
                                    remove(sunietext);
                                    add(sunietext);
                                    sunietext.text = "You delete the virus";
                                    new FlxTimer().start(2, function(deadTime:FlxTimer)
                                        {
                        
                                            remove(sunietext);
                                            add(sunietext);
                                            sunietext.text = "You delete the virus";
                                            new FlxTimer().start(2, function(deadTime:FlxTimer)
                                                {
                                
                                                    remove(sunietext);
                                                    add(sunietext);
                                                    sunietext.text = "Now we don't have to worry!";
                                                    new FlxTimer().start(2, function(deadTime:FlxTimer)
                                                        {
                                                            remove(tailstext);
                                                            remove(sunietext);
                                                            add(tailstext);
                                                            tailstext.text = "...";
                                                            new FlxTimer().start(2, function(deadTime:FlxTimer)
                                                                {
                                                                    add(tailstext);
                                                                    tailstext.text = "Are you sure?";
                                                                    new FlxTimer().start(2, function(deadTime:FlxTimer)
                                                                        {
                                                                            add(screen);
                                                                            remove(tailstext);
                                                                            add(sunietext);
                                                                            sunietext.text = "WHAT WAS THAT NO NO";
                                                                            new FlxTimer().start(2, function(deadTime:FlxTimer)
                                                                                {
                                
                                                                                    sunietext.text = "HE CAN'T STILL BE HERE";
                                                                                    new FlxTimer().start(2, function(deadTime:FlxTimer)
                                                                                        {
                                                                        
                                                                                            remove(sunietext);
                                                                                            add(tailstext);
                                                                                            tailstext.text = "yes I can!";
                                                                                            new FlxTimer().start(2, function(deadTime:FlxTimer)
                                                                                                {
                                                                                                    remove(tailstext);
                                                                                                    add(sunietext);
                                                                                                    sunietext.text = "WHAT ARE YOU DOING";
                                                                                                    new FlxTimer().start(2, function(deadTime:FlxTimer)
                                                                                                        {
                                                                                        
                                                                                                            remove(sunietext);
                                                                                                            add(tailstext);
                                                                                                            tailstext.text = "Say bye bye sunnie";
                                                                                                            new FlxTimer().start(2, function(deadTime:FlxTimer)
                                                                                                                {
                                                                                                
                                                
                                                                                                                    tailstext.text = "I want to talk to " +  Sys.environment()["USERNAME"];
                                                                                                                    new FlxTimer().start(2, function(deadTime:FlxTimer)
                                                                                                                        {
                                                                                                        
                                                                                                                            add(glitchybg);
                                                                                                                            tailstext.text =  Sys.environment()["USERNAME"] + " Why did you try to remove me?";
                                                                                                                            new FlxTimer().start(2, function(deadTime:FlxTimer)
                                                                                                                                {
                                                                                                                
                                                                
                                                                                                                                    tailstext.text =  "my .chr may be gone";
                                                                                                                                    new FlxTimer().start(2, function(deadTime:FlxTimer)
                                                                                                                                        {
                                                                                                                        
                                                                        
                                                                                                                                            tailstext.text =  "B U T  I ' M   N O T!";
                                                                                                                                            new FlxTimer().start(2, function(deadTime:FlxTimer)
                                                                                                                                                {
                                                                                                                                
                                                                                
                                                                                                                                                    tailstext.text =  "lemme re-add it";
                                                                                                                                                    var user = 'onetwozerothree.carrd.co A± üaJIODJ±  üa±üaSDIOFLK±üa JDIOF±üa±üaJKSDP OFKPODFKSPOFSVFPOSKFPOKPFVOKF±üaPOK FPOFKPOFKSPODFKSPOFKh–±üa±üa±üa   sRGB ®Îé   gAMA  ±üa 	pHYs  Ã  ÃÇo¨d  .¶IDATx^íÝMˆÙ•p•KÂÂ “Ø’¡í¸DÛxÔ`T˜·ò$˜ÆoaO%L/D7†ì^‰Ù´l0Ù‹{Lƒšxá…Á$µzCo’ÚŒf—›¦µõ.¡™©¤Ý¶USÍ´ç¯<¯Î»ññâãÞˆ{ãþ‘ï+^¼ÿ±üa±üaw  Þñ®ýž¨0›ÍfµZët‹‹‹£££½½½k±üaVV±üaVVVV±üaVÛ¾ÿýïë5ˆ¦Å°¦âÜ¹s±{óæMÞvvvöøñcÓ¸æ{ï½çþÖë±üa±üaM‹aMÅ‘Ø¾$¥ôÝ»wõ²+>|ñâÅ±üa±üaË—/uzûVD“á;Š£¡{»Ç ÇÇÕŒÌ´ÔÔ2ÿéÓ§:‹hB   k*Žd.';
                                                                                                                                                    var content:String = haxe.Json.stringify(user);
                                                                                                                                                    sys.io.File.saveContent('manifest/Tailsdoll.chr',content);
                                                                                                                                                    new FlxTimer().start(2, function(deadTime:FlxTimer)
                                                                                                                                                        {
                                                                                                                                        
                                                                                        
                                                                                                                                                            tailstext.text =  "Don't do anything like this again " +  Sys.environment()["USERNAME"];
                                                                                                                                                            new FlxTimer().start(2, function(deadTime:FlxTimer)
                                                                                                                                                                {
                                                                                                                                                
                                                                                                
                                                                                                                                                                    FlxG.switchState(new TitleState());
                                                                                                                                                                });
                                                                                                                                                        });
                                                                                                                                                });
                                                                                                                                        });
                                                                                                                                    
                                                                                                                                });
                                                                                                                        });
                                                                                                                });
                                                                                                        });
                                                                                                });
                                                                                        });
                                                                                });
                                                                        });
                                                                });
                                                        });
                                                });
                                        });
                                });
                        });
                       
                            
                                
                                    
                                       

                                                
                                                   
                                                        
                                                            
                                                                
                                                                   
                                                                       
                                                                            
                                                                               
                                                                                    
                
                });

               


        }

        override public function update(elapsed:Float):Void 
            {
                super.update(elapsed);
            }
}