package ae;
import kha.audio1.AudioChannel;
import kha.audio1.Audio;

class AudioClip extends kha.Sound{
	private var channel:Null<AudioChannel> = null;
	@:isVar public var volume(get,set):Float;
	function get_volume():Float{
		return channel.volume;
	}
	function set_volume(v:Float):Float{
		channel.volume = v;
		return channel.volume;
	}
	public function play(){
		if(channel == null){
			channel = Audio.play(this,false);
		}
		else {
			channel.play();
		}
	}
	public function stop():Void{
		channel.stop();
	}
	public function pause():Void{
		channel.pause();
	}
	
}