package ae;

import kha.audio2.AudioChannel;
import kha.audio1.Audio;
import kha.Sound;
import kha.arrays.Float32Array;

class Oscillator {
	static var buf:Float32Array = new Float32Array(AudioManager.instance.sampleRate);
	static var snd:Sound = new Sound();
	static var mult:Float =AudioManager.instance.sampleRate;
	static var const:Float = 2*Math.PI;
	static var channel:AudioChannel = new AudioChannel(true);

	static var phase = -const;
	static var t = 0;
	public static function sin(amp:Float,freq:Float):Float{
		var y = amp*Math.sin(phase);
		phase += (const*freq)/mult;
		if(phase > const){
			phase -= const;
			trace(t);
			trace("stopped");

		}
		return y;
	}
	static var lastSecond:Float = 0.0;
	static var isPlaying =false;
	public static function update(dt:Float){
		if(channel.data == null){
			channel.data = buf;
		}
		if(Input.note.length > 0 && !isPlaying){
			phase = 0.0;
			channel.volume = 0.7;
			var freq = Notes.toFreq(Input.note[0]);
			for(i in 0...AudioManager.instance.sampleRate){
				channel.data[i]= sin(1.0,freq);
				t = i;
				

			}
			// channel.data[channel.data.length] = channel.data[0];
			Audio._playAgain(channel);
			isPlaying = true;
			// trace(freq);
		}
		else if(Input.note.length == 0 && channel.data != null) {
			isPlaying = false;
			channel.volume = 0.0;
		}
	}
}