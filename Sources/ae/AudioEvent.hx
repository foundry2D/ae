package ae;

class AudioEvent extends IEvent {
	private var canUpdate = false;
	public var clip:Pair<Float,AudioClip>;
	public var mixer:Null<MixerChannel> = null;
	private var volume:Float = 0.0;
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
	public function stop():Void{
		canUpdate = false;
	}
	public override update(){
		if(AudioManager.instance.isLinear){
			if(AudioManager.instance.position >= start && !clip.second.isPlaying()){
				if(position >= clip.position){
					clip.second.play();
				}
				
			}
		}
		else if(position >= clip.position && !clip.second.isPlaying()){
			clip.second.play();
		}
		for(c in children){
			c.update();
		}
		if(mixer != null){
			
		}
	}
}