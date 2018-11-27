package ae;
import kha.arrays.Float32Array;

class AudioManager {
	var bpm = 120;
	var time = [4,4];
	var metro = false;
	static var freqs:Float32Array = new Float32Array(87);
	var ref:Pair<Int,Int> = new Pair(69,440);// Midi number,Freq
	public static var instance(default, null):AudioManager = new AudioManager();
	private function new(){
		setTuning(Tunings.TET12);

	}
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
	 * @param i
	 * @return Float frequency value
	 */
	public function ToFreqs(i:Int):Float{
		if(i >=21){
			return freqs[i-21];
		}
		return 0.0;
	}
		
}

