package;

import ae.AudioManager;
import kha.Assets;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

class Main {
	static var snd:Null<ae.AudioClip>;
	static var godown:Bool = false;
	static function update(): Void {
		if(snd!= null){
			trace(snd.isPlaying());
		}
		

	}

	static function render(frames: Array<Framebuffer>): Void {

	}

	public static function main() {
		System.start({title: "Project", width: 1024, height: 768}, function (_) {
			// Just loading everything is ok for small projects
			Assets.loadEverything(function () {
				// Avoid passing update/render directly,
				// so replacing them via code injection works
				Scheduler.addTimeTask(function () { update(); }, 0, 1 / 60);
				System.notifyOnFrames(function (frames) { render(frames); });
				AudioManager.instance;
				snd = new ae.AudioClip('tone');
				snd.play();
				snd.volume = 0.1;
				snd.stop();
				
			});
		});
	}
}
