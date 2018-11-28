package ae;

class AudioEvent extends IEvent {
	private var canUpdate = false;
	public var clip:Pair<Float,AudioClip>;
	public var mixer:Null<MixerChannel> = null;
	function new (clip:AudioClip,start:Float,end:Float,loops:Bool){
		this.start = start;
		this.end = end;
		this.loops = loops;
		this.clip = new Pair(start,clip);
		this.type = EventType.audio;

	}
	public function play():Void{
		canUpdate = true;
	}
	public override update(){
		if(AudioManager.instance.position >= start){
			
		}
	}
}