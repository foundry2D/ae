package ae;

class Pair<T,TX> {
	public function new(f:T, s:TX){
		this.first = f;
		this.second = s;
	}
	@:isVar public var first(get,set):T;
	function get_first():T{
		return first;
	}
	function set_first(s):T{
		this.first = s;
		return first;
	}
	@:isVar public var second(get,set):TX;
	function get_second():TX{
		return second;
	}
	function set_second(s):TX{
		this.second = s;
		return second;
	}
	public static inline function round(number:Float, ?precision=2): Float
	{
		number *= Math.pow(10, precision);
		return Math.round(number) / Math.pow(10, precision);
	}
}
