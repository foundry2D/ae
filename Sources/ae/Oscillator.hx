package ae;

import kha.audio2.AudioChannel;
import kha.audio1.Audio;
import kha.Sound;
import kha.arrays.Float32Array;

class Oscillator {
	static var buf:Float32Array = new Float32Array(AudioManager.instance.sampleRate);
	static var snd:Sound = new Sound();
	static var mult:Float =1/AudioManager.instance.sampleRate;
	static var const:Float = 2*Math.PI;
	static var channel:AudioChannel = new AudioChannel(true);
	public static var initPhase=0.0;
	public static var oscType:Waveforms = Waveforms.Sin;
	// public static var voices:Array<Voice>

	static var phase = 0.0;
	static var endIndex = 0;
	static var cycleStop = false;
	static function phaseIterate(freq:Float):Void{
		phase += (const*freq)*mult;
		if(phase > const+initPhase){ // Has arrived at end of cycle
			phase -= const;
			if(endIndex >= AudioManager.instance.sampleRate - 150){
				cycleStop = true;
			}

		}

	}
	public static function sin(amp:Float,freq:Float):Float{
		var y = amp*Math.sin(phase);
		phaseIterate(freq);
		return y;
	}
	public static function square(amp:Float,freq:Float):Float{
		var y = 0.0;
		if(phase < Math.PI){
			y= amp;
		}
		else{
			y= -amp;
		}
		phaseIterate(freq);
		return y;
	}
	public static function saw(amp:Float,freq:Float):Float{
		var y = amp-(amp/Math.PI*phase);
		phaseIterate(freq);
		return y;
	}
	public static function tri(amp:Float,freq:Float):Float{
		var y = 0.0;
		var value = (2*amp/Math.PI) *phase;
		if(phase < Math.PI){
			y= -amp + value;
		}
		else{
			y = 3*amp -value;
		}
		phaseIterate(freq);
		return y;
	}
	static var lastSecond:Float = 0.0;
	static var isPlaying =false;
	public static function update(dt:Float){
		if(channel.data == null){
			channel.data = buf;
		}
		if(Input.note.length > 0 && !isPlaying){
			phase = initPhase;
			channel.volume = 0.7;
			var freq = Notes.toFreq(Input.note.first());
			var a:Array<Float> = [];
			for(i in 0...AudioManager.instance.sampleRate){
				var value = tri(1.0,freq);
				if(cycleStop)
					break;
				a.push(value);
				endIndex = i;
				

			}
			var temp = new Float32Array(a.length);
			for(i in 0...a.length){
				temp[i] = a[i];
			}
			channel.data = temp;
			cycleStop = false;
			Audio._playAgain(channel);
			isPlaying = true;
		}
		else if(Input.note.length == 0 && channel.data != null) {
			isPlaying = false;
			channel.volume = 0.0;
			endIndex=0;
		}
	}
}

@:enum abstract Waveforms(Int) from Int{
	var Sin = 0;
	var Square = 1;
	var Saw = 2;
	var Triangle = 3;
}