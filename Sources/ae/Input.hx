package ae;

import kha.input.KeyCode;
class Input {
	public static var note:Array<Notes> = [];
	private static var numPressed = 0;

	public static function onKeyDown(keyCode:Int){
		switch(keyCode){
			case KeyCode.A:
				note.push(Notes.C4);
			case KeyCode.W:
				note.push(Notes.DD4);
			case KeyCode.S:
				note.push(Notes.D4);
			case KeyCode.D:
				note.push(Notes.E4);
			default:
				return;
		}
		trace(note);

	}
	public static function onKeyUp(keyCode:Int){
		switch(keyCode){
			case KeyCode.A:
				note.remove(Notes.C4);
			case KeyCode.W:
				note.remove(Notes.DD4);
			case KeyCode.S:
				note.remove(Notes.D4);
			case KeyCode.D:
				note.remove(Notes.E4);
			default:
				return;
		}
		trace(note);
		
	}
}