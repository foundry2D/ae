package ae;

class MixerChannel {
	public var index:Int;
	public var invertPhase:Bool = false;
	@:isVar public var volume(get,set):Float = 1.0;
	function get_volume():Float{
		if(parent != null){
			return Amplitude.add(volume,parent.volume);
		}
		return volume;
	}
	function set_volume(v:Float):Float{
		volume = v;
		dirty = true;
		return volume;
	}
	@:isVar public var dirty(get,set):Bool;
	function get_dirty():Bool{
		if(parent != null){
			return dirty || parent.dirty;
		}
		return dirty;
	}
	function set_dirty(v:Bool):Bool{
		dirty = v;
		return dirty;
	}
	public function new (index:Int,?parent:Null<Int>) {
		this.index = index;
		if(index == 0)
			return;
		if(parent > 0){
			this.parent = AudioManager.instance.mixer.children.get(index);
		}
		else {
			this.parent = AudioManager.instance.mixer;
		}
	}
	var parent:Null<MixerChannel>;
	var children:Map<Int,MixerChannel> = [];

}