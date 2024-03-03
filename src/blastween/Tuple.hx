package blastween;

typedef TupleType<T1, T2> = {
	var a:T1;
	var b:T2;
}

abstract Tuple<T1, T2>(TupleType<T1, T2>) {
	public inline function new(t1:T1, t2:T2) {
		this = {
			a: t1,
			b: t2
		};
	}

	@:arrayAccess
	public inline function get(key:Int):Dynamic {
		switch (key) {
			case 0:
				return this.a;
			case 1:
				return this.b;
			default:
				return null;
		}
	}

	@:arrayAccess
	public inline function set(key:Int, value:Dynamic):Dynamic {
		switch (key) {
			case 0:
				return this.a = value;
			case 1:
				return this.b = value;
			default:
				return null;
		}
	}
}
