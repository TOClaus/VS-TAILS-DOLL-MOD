package;
import flixel.system.FlxAssets.FlxShader;
import openfl.filters.ShaderFilter;
import openfl.filters.BitmapFilter;
import Shaders;
import Options;
class ModChart {
  private var playState:PlayState;
  private var camShaders=[];
  private var hudShaders=[];
  private var noteShaders=[];
  private var sussyShaders=[];

  public var playerNotesFollowReceptors=true;
  public var opponentNotesFollowReceptors=true;
  public var hudVisible=true;
  public var opponentHPDrain:Float = 0;

  public function new(playState:PlayState){
    this.playState=playState;

  }

  public function addNoteEffect(effect:ShaderEffect,?sussy:Bool=true){
    noteShaders.push(effect);
    var newCamEffects:Array<BitmapFilter>=[]; // IT SHUTS HAXE UP IDK WHY BUT WHATEVER IDK WHY I CANT JUST ARRAY<SHADERFILTER>
    for(i in noteShaders){
      newCamEffects.push(new ShaderFilter(i.shader));
    }
    playState.camNotes.setFilters(newCamEffects);
    if(sussy)
      addSusEffect(effect);
  }

  public function removeNoteEffect(effect:ShaderEffect,?sussy:Bool=true){
    noteShaders.remove(effect);
    var newCamEffects:Array<BitmapFilter>=[];
    for(i in noteShaders){
      newCamEffects.push(new ShaderFilter(i.shader));
    }
    playState.camNotes.setFilters(newCamEffects);
    if(sussy)
      removeSusEffect(effect);
  }

  public function addSusEffect(effect:ShaderEffect){
    sussyShaders.push(effect);
    var newCamEffects:Array<BitmapFilter>=[]; // IT SHUTS HAXE UP IDK WHY BUT WHATEVER IDK WHY I CANT JUST ARRAY<SHADERFILTER>
    for(i in sussyShaders){
      newCamEffects.push(new ShaderFilter(i.shader));
    }
    playState.camSus.setFilters(newCamEffects);
  }

  public function removeSusEffect(effect:ShaderEffect){
    sussyShaders.remove(effect);
    var newCamEffects:Array<BitmapFilter>=[];
    for(i in sussyShaders){
      newCamEffects.push(new ShaderFilter(i.shader));
    }
    playState.camSus.setFilters(newCamEffects);
  }

  public function addCamEffect(effect:ShaderEffect){
    camShaders.push(effect);
    var newCamEffects:Array<BitmapFilter>=[]; // IT SHUTS HAXE UP IDK WHY BUT WHATEVER IDK WHY I CANT JUST ARRAY<SHADERFILTER>
    for(i in camShaders){
      newCamEffects.push(new ShaderFilter(i.shader));
    }
    playState.camGame.setFilters(newCamEffects);
    playState.camRating.setFilters(newCamEffects);
  }

  public function removeCamEffect(effect:ShaderEffect){
    camShaders.remove(effect);
    var newCamEffects:Array<BitmapFilter>=[];
    for(i in camShaders){
      newCamEffects.push(new ShaderFilter(i.shader));
    }
    playState.camGame.setFilters(newCamEffects);
    playState.camRating.setFilters(newCamEffects);
  }

  public function addHudEffect(effect:ShaderEffect){
    hudShaders.push(effect);
    var newCamEffects:Array<BitmapFilter>=[];
    for(i in camShaders){
      newCamEffects.push(new ShaderFilter(i.shader));
    }
    playState.camHUD.setFilters(newCamEffects);
  }

  public function removeHudEffect(effect:ShaderEffect){
    hudShaders.remove(effect);
    var newCamEffects:Array<BitmapFilter>=[];
    for(i in camShaders){
      newCamEffects.push(new ShaderFilter(i.shader));
    }
    playState.camHUD.setFilters(newCamEffects);
  }


  public function update(elapsed:Float){

  }
}
