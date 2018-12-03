package ae;

class AudioEvent extends IEvent<AudioClip> {
	public var mixer:Null<MixerChannel> = null;
	private var volume:Float = 0.0;
	public function new (clip:AudioClip,start:Float,end:Float,loops:Bool){
		this.start = start;
		this.end = end;
		this.loops = loops;
		this.clip = new Pair(clip,cast(clip,Clip));
		this.type = EventType.audio;
		this.name = clip.name;

	}
	public override function play():Void{
		super.play();
		canUpdate = true;
	}
	public override function stop():Void{
		super.stop();
		canUpdate = false;
		clip.first.stop();
	}
	public override function update():Void{
		if(!canUpdate)
			return;
		super.update();
		if(mixer != null && mixer.dirty || mixer != null && clip.first.dirty){
			clip.first.sum_volume(mixer.volume);

		}
		else if(clip.first.dirty){
			clip.first.sum_volume();
		}
	}
}