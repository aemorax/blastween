package blastween;

class Easing {
	public static final LINEAR:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.linear(t) * (to - from);
	}

	public static final QUAD_IN:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.quadIn(t) * (to - from);
	}

	public static final QUAD_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.quadOut(t) * (to - from);
	}

	public static final QUAD_IN_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.quadInOut(t) * (to - from);
	}

	public static final CUBE_IN:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.cubeIn(t) * (to - from);
	}

	public static final CUBE_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.cubeOut(t) * (to - from);
	}

	public static final CUBE_IN_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.cubeInOut(t) * (to - from);
	}

	public static final QUART_IN:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.quartIn(t) * (to - from);
	}
}
