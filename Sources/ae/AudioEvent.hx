package ae;

class AudioEvent extends IEvent<AudioClip> {
	private var canUpdate = false;
	public var mixer:Null<MixerChannel> = null;
	private var volume:Float = 0.0;
	public function new (clip:AudioClip,start:Float,end:Float,loops:Bool){
		this.start = start;
		this.end = end;
		this.loops = loops;
		this.clip = new Pair(clip,cast(clip,Clip));
		this.type = EventType.audio;

	}
	public function play():Void{
		canUpdate = true;
	}
	public function stop():Void{
		canUpdate = false;
	}
	public override function update():Void{
		super.update();
		if(mixer != null && mixer.dirty || clip.first.dirty){
			clip.first.sum_volume(mixer.volume);

		}
		else if(clip.first.dirty){
			clip.first.sum_volume();
		}
	}
}