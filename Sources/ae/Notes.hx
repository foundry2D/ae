package ae;

@:enum abstract Notes(Int) from Int{
	// @:access(ae.AudioManager.ToFreqs)
	// static var toStringMap:Map<Notes, String> = MacroTools.buildMap("ae.Notes",true);
	var A0=21;
	var BB0=22;
	var B0=23;
	var C1=24;
	var DD1=25;
	var D1=26;
	var EE1=27;
	var E1=28;
	var F1=29;
	var GG1=30;
	var G1=31;
	var AA1=32;
	var A1=33;
	var BB1=34;
	var B1=35;
	var C2=36;////////////////
	var DD2=37;
	var D2=38;
	var EE2=39;
	var E2=40;
	var F2=41;
	var GG2=42;
	var G2=43;
	var AA2=44;
	var A2=45;
	var BB2=46;
	var B2=47;
	var C3=48;////////////////
	var DD3=49;
	var D3=50;
	var EE3=51;
	var E3=52;
	var F3=53;
	var GG3=54;
	var G3=55;
	var AA3=56;
	var A3=57;
	var BB3=58;
	var B3=59;
	var C4=60;////////////////
	var DD4=61;
	var D4=62;
	var EE4=63;
	var E4=64;
	var F4=65;
	var GG4=66;
	var G4=67;
	var AA4=68;
	var A4=69;
	var BB4=70;
	var B4=71;
	var C5=72;////////////////
	var DD5=73;
	var D5=74;
	var EE5=75;
	var E5=76;
	var F5=77;
	var GG5=78;
	var G5=79;
	var AA5=80;
	var A5=81;
	var BB5=82;
	var B5=83;
	var C6=84;////////////////
	var DD6=85;
	var D6=86;
	var EE6=87;
	var E6=88;
	var F6=89;
	var GG6=90;
	var G6=91;
	var AA6=92;
	var A6=93;
	var BB6=94;
	var B6=95;
	var C7=96;////////////////
	var DD7=97;
	var D7=98;
	var EE7=99;
	var E7=100;
	var F7=101;
	var GG7=102;
	var G7=103;
	var AA7=104;
	var A7=105;
	var BB7=106;
	var B7=107;
	var C8=108;
	static var toIntMap:Map<Notes,Int> = MacroTools.buildMap("ae.Notes",false,true);
	static var toNoteMap:Map<Int,Notes> = MacroTools.buildMap("ae.Notes",false,true);
	/**
	 * [Description]
	 * Returns the frequency based on the Notes enum value
	 * @param n 
	 * @return Float
	 */
	public static inline function toFreq(n:Notes):Float{
		return AudioManager.instance.toFreqs(toMidi(n));
	}
	public static inline function toMidi(n:Notes):Int {
		return toIntMap.get(n);
	}
	public static inline function toNote(m:Int):Notes {
		return toNoteMap.get(m);
	}
	
}