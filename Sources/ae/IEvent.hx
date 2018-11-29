package ae;

class IEvent {
	private var start:Float;
	private var end:Float;
	private var loops:Bool;
	public var length(get,null):Float;
	function get_length():Float{
		return end-start;
	}
	public var position(get,null):Float;
	function get_position():Float{
		return position;
	}
	private var parent:Null<IEvent> = null;
	private var children:Array<IEvent> = [];
	public var type:EventType;
	public function update():Void{return;};
}