package ae;

import haxe.ds.ObjectMap;
import haxe.ds.Map;
import kha.arrays.Float32Array;
import ae.Timer;
import ae.Input;

class AudioManager {
	public var isLinear:Bool = true;// i.e. : In composition mode or In-game
	var bpm = 120;
	var time = [4,4];
	public var position:Float = 0.0;
	var metro = false;
	static var freqs:Float32Array = new Float32Array(87);
	var objects:ObjectMap<{},Int> = new ObjectMap();
	var registered:Array<Array<IEvent<Clip>>> = [];
	var ref:Pair<Int,Int> = new Pair(69,440);// Midi number,Frequency
	public var sampleRate = 44100;
	public static var instance(default, null):AudioManager = new AudioManager();
	private var timer:Timer;
	// public var index(get,null):Int = -1;// Master is 0
	// function get_index():Int{
	// 	return index+=1;
	// }
	private var mixIndex(get,null):Int = -1;// Master is 0
	function get_mixIndex():Int{
		return mixIndex+=1;
	}
	public var mixer:MixerChannel;
	private function new(){
		this.timer = new Timer();
		mixer= new MixerChannel(mixIndex);
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
	public function addChannel(?pIndex:Null<Int>):MixerChannel {
		if(pIndex == null){
			return new MixerChannel(mixIndex,0);
		}
		else {
			return new MixerChannel(mixIndex,pIndex);
		}
		
	}
	/**
	 * Try to register an IEvent; true on success and false on fail
	 * @param event 
	 * @return Bool
	 */
	public function register(event:Any,?object:Null<Any>=null):Bool{
		var obj = object;
		if(obj == null){
			obj = this;
		}
		if(Std.is(event,IEvent)){
			if(!objects.exists(obj)){
				var t:Array<IEvent<Clip>> = [];
				t.push((event:IEvent<Clip>));
				objects.set(obj,registered.length);
				registered.push(t);
			}
			else{
				registered[objects.get(obj)].push((event:IEvent<Clip>));
			}
			return true;
		}
		return false;
	}
	public function unregister(name:String,object:Null<Any>){
		var obj = object;
		if(obj == null){
			obj = this;
		}
		var t:Array<IEvent<Clip>> = [];
		if(object != null && objects.exists(object)){
			for(e in registered[objects.get(object)]){
				if(e.name == name && e.isPlaying()){
					e.stop();
					t.push(e);
				}
				else if(e.name == name){
					t.push(e);
				}

			}
			for(e in t){
				registered[objects.get(object)].remove(e);
			}
		}
		
	}
	public function update():Void {
		timer.update();
		Oscillator.update(timer.delta);
		if(isLinear){
			for(e in registered){
				for(t in e){
					t.update();
				}
			}
		}
		position += 0.1*timer.delta;
		

	}
		
}

