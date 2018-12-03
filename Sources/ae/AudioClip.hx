package ae;
import kha.arrays.Float32Array;
import kha.audio2.Buffer;
import kha.audio1.AudioChannel;
import kha.audio1.Audio;
import kha.Sound;
import kha.Assets;
import kha.AssetError;

class AudioClip extends Clip {
	private var channel:Null<AudioChannel> = null;
	private var snd:Null<Sound>;
	private var b:Buffer = new Buffer(AudioManager.instance.sampleRate,2,AudioManager.instance.sampleRate);
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
	private var lastPitch = 1.0;
	@:isVar public var pitch(get,set):Float=1.0;
	function get_pitch():Float{
		return pitch;
	}
	function set_pitch(v:Float):Float{
		pitch = v;
		return pitch;
	}
	public function new(s:String){
		var t = Assets.sounds.get(s);
		if(t == null){
			Assets.loadSound(s,load, error);
		}
		else {
			this.snd = t;
			b.data = snd.uncompressedData;
			this.name = s;
			trace(this.name);
		}
		

		
	}
	function load(s:kha.Sound):Void{
		this.snd = s;
		b.data = snd.uncompressedData;
		
	}
	function error(error:AssetError):Void{
		trace(error);
	}
	public override function play(){
		var pitchDirty = false;
		snd.uncompressedData = b.data;
		if(snd != null && pitch != lastPitch){
			var t:Float32Array = new Float32Array(Std.int(AudioManager.instance.sampleRate*pitch));
			for(i in 0...t.length){
				snd.uncompressedData[i] *=pitch;
			}
			// b.samplesPerSecond = Std.int(b.samplesPerSecond*pitch);
			pitchDirty = true;
			// trace(b);
			trace("was here");
		}
		if(channel == null && snd != null || pitchDirty){
			channel = Audio.play(this.snd,false);
			paused =false;
			lastPitch = pitch;
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