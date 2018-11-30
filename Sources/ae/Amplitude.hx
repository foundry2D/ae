package ae;

class Amplitude {
	//TODO
	public static function ToDB(vol:Float):Float{
		return 0.0;
	}
	//TODO
	public static function ToVolume(dB:Float):Float{
		return 0.0;
	}
	/**
	 * Adds two amplitudes of sound; 
	 * @param vol1 Initial
	 * @param vol2 Target
	 * @return Float
	 */
	public static function add(vol1:Float,vol2:Float):Float{
		var out:Float = 1.0;
		if(vol2 > vol1){
			out = Math.sqrt(vol2*vol2+vol1*vol1);
		}
		if(vol2 < vol1){
			out = Math.sqrt(vol1*vol1-vol2*vol2);
		}
		if(out > 1.0){
			return 1.0;
		}
		return out;
	}
	
}
