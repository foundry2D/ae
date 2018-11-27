package ae;

@:enum abstract Notes(Int) from Int{
	// @:access(ae.AudioManager.ToFreqs)
	static var toIntMap:Map<Notes,Int> = MacroTools.buildMap("ae.Notes",false,true);
	// static var toStringMap:Map<Notes, String> = MacroTools.buildMap("ae.Notes",true);
	var A0=21;
	var Bb0=22;
	var B0=23;
	var C1=24;
	var Db1=25;
	var D1=26;
	var Eb1=27;
	var E1=28;
	var F1=29;
	var Gb1=30;
	var G1=31;
	var Ab1=32;
	var A1=33;
	var Bb1=34;
	var B1=35;
	var C2=36;////////////////
	var Db2=37;
	var D2=38;
	var Eb2=39;
	var E2=40;
	var F2=41;
	var Gb2=42;
	var G2=43;
	var Ab2=44;
	var A2=45;
	var Bb2=46;
	var B2=47;
	var C3=48;////////////////
	var Db3=49;
	var D3=50;
	var Eb3=51;
	var E3=52;
	var F3=53;
	var Gb3=54;
	var G3=55;
	var Ab3=56;
	var A3=57;
	var Bb3=58;
	var B3=59;
	var C4=60;////////////////
	var Db4=61;
	var D4=62;
	var Eb4=63;
	var E4=64;
	var F4=65;
	var Gb4=66;
	var G4=67;
	var Ab4=68;
	var A4=69;
	var Bb4=70;
	var B4=71;
	var C5=72;////////////////
	var Db5=73;
	var D5=74;
	var Eb5=75;
	var E5=76;
	var F5=77;
	var Gb5=78;
	var G5=79;
	var Ab5=80;
	var A5=81;
	var Bb5=82;
	var B5=83;
	var C6=84;////////////////
	var Db6=85;
	var D6=86;
	var Eb6=87;
	var E6=88;
	var F6=89;
	var Gb6=90;
	var G6=91;
	var Ab6=92;
	var A6=93;
	var Bb6=94;
	var B6=95;
	var C7=96;////////////////
	var Db7=97;
	var D7=98;
	var Eb7=99;
	var E7=100;
	var F7=101;
	var Gb7=102;
	var G7=103;
	var Ab7=104;
	var A7=105;
	var Bb7=106;
	var B7=107;
	var C8=108;
	/**
	 * [Description]
	 * Returns the frequency based on the Notes enum value
	 * @param n 
	 * @return Float
	 */
	public static inline function ToFreq(n:Notes):Float{
		return AudioManager.instance.ToFreqs(toIntMap.get(n));
	}
	
}