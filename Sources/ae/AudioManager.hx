package ae;
import kha.arrays.Float32Array;
import kha.Assets;

class AudioManager {
	var isLinear:Bool = true;// i.e. : In composition mode or In-game
	var bpm = 120;
	var time = [4,4];
	var metro = false;
	static var freqs:Float32Array = new Float32Array(87);
	var registered:Array<IEvent> = [];
	var ref:Pair<Int,Int> = new Pair(69,440);// Midi number,Frequency
	public static var instance(default, null):AudioManager = new AudioManager();
	private function new(){
		setTuning(Tunings.TET12);
		// var snd:AudioClip = new AudioClip(Assets.sounds.get("tone.wav"));
		// snd.play();

	}
	
	/**
	 * [Description]
	 * Receives a tuning and sets the frequency data accordingly
	 * @param tune
	 */
	function setTuning(tune:Tunings):Void {
		switch tune {
			case Tunings.TET12:
				for(i in 0...freqs.length){
					var number:Int = ref.first;
					if(i < ref.first){
						number = -(ref.first-21) + i;
					}
					else if(i > ref.first){
						number = i-(ref.first-21);
					}
					freqs[i] = Math.pow(2, number* 0.083333333) * ref.second;
				}
				
		}
			
	}
	/**
	 * [Description]
	 * Returns the frequency based on the midi note number
	 * @param m
	 * @return Float frequency value if is between midi note 21 to 108
	 */
	public function toFreqs(m:Int):Float{
		if(m >=21 && m <= 108){
			return freqs[m-21];
		}
		return 0.0;
	}
	public function update():Void {
		if(isLinear){
			for(e in registered){
				e.update();
			}
		}
		

	}
		
}

