package ae;

class IEvent<T> {
	public var clip:Pair<T,Clip>;
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
	private var parent:Null<IEvent<T>> = null;
	private var children:Array<IEvent<T>> = [];
	public var type:EventType;
	public function update():Void{
		if(AudioManager.instance.isLinear){
			if(AudioManager.instance.position >= start && !clip.second.isPlaying()){
				if(position >= clip.second.position){
					clip.second.play();
				}
				
			}
		}
		else if(position >= clip.second.position && !clip.second.isPlaying()){
			clip.second.play();
		}
		for(c in children){
			c.update();
		}
	}
}