package ae;
import kha.audio1.AudioChannel;
import kha.audio1.Audio;
import kha.Sound;
import kha.Assets;
import kha.AssetError;

class AudioClip extends Clip {
	private var channel:Null<AudioChannel> = null;
	private var snd:Null<Sound>;
	public var dirty:Bool = false;
	@:isVar public var volume(get,set):Float=1.0;
	function get_volume():Float{
		return volume;
	}
	function set_volume(v:Float):Float{
		dirty = true;
		volume = v;
		return volume;
	}
	public function new(s:String){
		var t = Assets.sounds.get(s);
		if(t == null){
			Assets.loadSound(s,load, error);
		}
		else {
			this.snd = t;
		}

		
	}
	function load(s:kha.Sound):Void{
		this.snd = s;
	}
	function error(error:AssetError):Void{
		trace(error);
	}
	public override function play(){
		if(channel == null && snd != null){
			channel = Audio.play(this.snd,false);
			paused =false;
		}
		else if(channel != null && snd != null) {
			channel.play();
			paused =false;
		}
		if(dirty){
			channel.volume = volume;
		}
	}
	public override function stop():Void{
		channel.stop();
	}
	public override function pause():Void{
		channel.pause();
		paused =true;
	}
	public override function isPlaying():Bool {
		return channel != null && !channel.finished && !paused;
	}
	public function sum_volume(?v:Null<Float>):Void{
		if(v == null) {
			channel.volume = volume;
		}
		else{
			channel.volume = Amplitude.add(volume,v);
		}
		
	}
	
}