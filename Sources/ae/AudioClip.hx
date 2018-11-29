package ae;
import kha.audio1.AudioChannel;
import kha.audio1.Audio;
import kha.Sound;
import kha.Assets;
import kha.AssetError;

class AudioClip {
	private var channel:Null<AudioChannel> = null;
	private var snd:Null<Sound>;
	private var paused:Bool = false;
	@:isVar public var volume(get,set):Float;
	function get_volume():Float{
		return channel.volume;
	}
	function set_volume(v:Float):Float{
		channel.volume = v;
		return channel.volume;
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
	public function play(){
		if(channel == null && snd != null){
			channel = Audio.play(this.snd,false);
			paused =false;
		}
		else if(channel != null && snd != null) {
			channel.play();
			paused =false;
		}
	}
	public function stop():Void{
		channel.stop();
	}
	public function pause():Void{
		channel.pause();
		paused =true;
	}
	public function isPlaying():Bool {
		return !channel.finished && !paused;
	}
	
}