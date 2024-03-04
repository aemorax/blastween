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

	public static final QUART_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.quartOut(t) * (to - from);
	}

	public static final QUART_IN_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.quartInOut(t) * (to - from);
	}

	public static final QUINT_IN:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.quintIn(t) * (to - from);
	}

	public static final QUINT_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.quintOut(t) * (to - from);
	}

	public static final QUINT_IN_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.quintInOut(t) * (to - from);
	}

	public static final SMOOTH_STEP_IN:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.smoothStepIn(t) * (to - from);
	}

	public static final SMOOTH_STEP_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.smoothStepOut(t) * (to - from);
	}

	public static final SMOOTH_STEP_IN_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.smoothStepInOut(t) * (to - from);
	}

	public static final SMOOTHER_STEP_IN:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.smootherStepIn(t) * (to - from);
	}

	public static final SMOOTHER_STEP_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.smootherStepOut(t) * (to - from);
	}

	public static final SMOOTHER_STEP_IN_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.smootherStepInOut(t) * (to - from);
	}

	public static final SINE_IN:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.sineIn(t) * (to - from);
	}

	public static final SINE_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.sineOut(t) * (to - from);
	}

	public static final SINE_IN_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.sineInOut(t) * (to - from);
	}

	public static final BOUNCE_IN:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.bounceIn(t) * (to - from);
	}

	public static final BOUNCE_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.bounceOut(t) * (to - from);
	}

	public static final BOUNCE_IN_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.bounceInOut(t) * (to - from);
	}

	public static final CIRC_IN:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.circIn(t) * (to - from);
	}

	public static final CIRC_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.circOut(t) * (to - from);
	}

	public static final CIRC_IN_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.circInOut(t) * (to - from);
	}

	public static final EXPO_IN:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.expoIn(t) * (to - from);
	}

	public static final EXPO_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.expoOut(t) * (to - from);
	}

	public static final EXPO_IN_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.expoInOut(t) * (to - from);
	}

	public static final BACK_IN:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.backIn(t) * (to - from);
	}

	public static final BACK_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.backOut(t) * (to - from);
	}

	public static final BACK_IN_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.backInOut(t) * (to - from);
	}

	public static final ELASTIC_IN:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.elasticIn(t) * (to - from);
	}

	public static final ELASTIC_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.elasticOut(t) * (to - from);
	}

	public static final ELASTIC_IN_OUT:EasingFunction = function(from, to, current, duration) {
		var t = current / duration;
		return from + Easer.elasticInOut(t) * (to - from);
	}
}
