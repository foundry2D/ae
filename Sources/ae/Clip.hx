package ae;

class Clip {
	public var name:String = "None";
	private var paused:Bool = false;
	public var position(get,null):Float;
	function get_position():Float{
		return position;
	}
	public function play():Void{};
	public function stop():Void{};
	public function pause():Void{};
	public function isPlaying():Bool{return false;}
}