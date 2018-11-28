package ae;

@:enum abstract EventType(Int) from Int{
	var audio = 0;
	var midi = 1;
	var animation = 2;
	var clip = 3;
}
