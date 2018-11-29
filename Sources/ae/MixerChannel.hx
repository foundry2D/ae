package ae;

class MixerChannel {
	public var index:Int;
	public var invertPhase:Bool = false;
	@:isVar public var volume(get,set):Float;
	function get_volume():Float{
		if(parent != null){
			return parent.volume *
		}
		return volume;
	}
	function set_volume(v:Float):Float{
		volume = v;
		return volume;
	}
	var parent:Null<MixerChannel> = null;
	var children:Array<MixerChannel> = [];

}