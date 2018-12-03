package ae;

class IEvent<T> {
	public var name:String = "None";
	public var clip:Pair<T,Clip>;
	private var start:Float;
	private var end:Float;
	private var loops:Bool;
	public var length(get,null):Float;
	private var canUpdate = false;
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
	public function play():Void{
		for(c in children){
			c.play();
		}
	}
	public function stop():Void{
		for(c in children){
			c.stop();
		}
	};
	public function update():Void{
		if(!canUpdate){
			return;
		}
		if(AudioManager.instance.isLinear){
			if(AudioManager.instance.position >= start && AudioManager.instance.position <= end && !clip.second.isPlaying()){
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
	public function isPlaying():Bool{
		return canUpdate;
	}
	public function addEvent(e:IEvent<T>):Void {
		children.push(e);
	}
	public function rmvEvent(e:IEvent<T>):Void {
		children.remove(e);
	}
}