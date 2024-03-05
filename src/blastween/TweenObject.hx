package blastween;

class TweenObject implements IUpdater {
	private final object:Dynamic;
	private final updateManager:Null<UpdateManager>;
	private final updateMap:Map<String, Tuple<Dynamic, Dynamic>>;

	private var isStarted:Bool = false;
	private var isPause:Bool = true;
	private var isLoop:Bool = false;
	private var isPingPong:Bool = false;
	private var repeat:Int = 0;
	private var currentRepeat:Int = 0;
	private var delay:Float = 0;
	private var delayRemain:Float = 0;
	private var easing:EasingFunction = Easing.LINEAR;
	private var time:Float = 0;
	private var duration:Float = 0;
	private var forward:Bool = true;

	public function new(object:Dynamic, updateMap:Map<String, Tuple<Dynamic, Dynamic>>, duration:Float, ?updater:UpdateManager = null) {
		this.object = object;
		this.updateMap = updateMap;
		this.duration = duration;
		this.updateManager = updater;
	}

	public dynamic function onStart():Void {}

	public dynamic function onPause():Void {}

	public dynamic function onCancel():Void {}

	public dynamic function onUpdate(val:Float):Void {}

	public dynamic function onComplete():Void {}

	public function start():TweenObject {
		this.onStart();
		if (this.updateManager != null) {
			this.updateManager.addUpdater(this);
		}
		this.isStarted = true;
		return this;
	}

	public function cancel():TweenObject {
		this.onCancel();
		if (this.updateManager != null) {
			this.updateManager.removeUpdater(this);
		}
		this.time = 0;
		this.delayRemain = 0;
		this.isStarted = false;
		return this;
	}

	public function pause():TweenObject {
		this.isPause = true;
		this.onPause();
		if (this.updateManager != null) {
			this.updateManager.removeUpdater(this);
		}
		return this;
	}

	public function resume():TweenObject {
		this.isPause = false;
		if (this.updateManager != null) {
			this.updateManager.addUpdater(this);
		}
		return this;
	}

	public function setDelay(delay:Float):TweenObject {
		this.delay = delay;
		return this;
	}

	public function setEase(ease:EasingFunction):TweenObject {
		this.easing = ease;
		return this;
	}

	public function setLoop(loop:Bool):TweenObject {
		this.isLoop = loop;
		return this;
	}

	public function setRepeat(count:Int):TweenObject {
		this.repeat = count;
		return this;
	}

	public function setPingPong(ping:Bool):TweenObject {
		this.isPingPong = ping;
		if (ping == true) {
			this.isLoop = true;
		}
		return this;
	}

	public function setOnStart(func:Void->Void):TweenObject {
		this.onStart = func;
		return this;
	}

	public function setOnPause(func:Void->Void):TweenObject {
		this.onPause = func;
		return this;
	}

	public function setOnCancel(func:Void->Void):TweenObject {
		this.onCancel = func;
		return this;
	}

	public function setOnUpdate(func:Float->Void):TweenObject {
		this.onUpdate = func;
		return this;
	}

	public function setOnComplete(func:Void->Void):TweenObject {
		this.onComplete = func;
		return this;
	}

	public function update(dt:Float):Void {
		if (!this.isStarted) {
			return;
		}

		if (delayRemain < delay) {
			delayRemain += dt;
			return;
		}

		if (this.duration <= this.time) {
			if (isLoop) {
				if (isPingPong)
					this.forward = !this.forward;
				this.time = 0;
			} else if (currentRepeat < repeat) {
				this.time = 0;
				this.currentRepeat += 1;
			} else {
				this.onComplete();
				this.updateManager.removeUpdater(this);
				return;
			}
		}
		this.time += dt;
		for (prop => from_to in this.updateMap) {
			if (isPingPong) {
				if (forward) {
					var from:Dynamic = from_to[0];
					var to:Dynamic = from_to[1];
					updatePropetries([prop], from, to);
				} else {
					var from:Dynamic = from_to[1];
					var to:Dynamic = from_to[0];
					updatePropetries([prop], from, to);
				}
			} else {
				var from:Dynamic = from_to[0];
				var to:Dynamic = from_to[1];
				updatePropetries([prop], from, to);
			}
		}
		if (this.duration == 0) {
			this.onUpdate(this.time);
		} else {
			this.onUpdate(this.time / this.duration);
		}
	}

	private function updatePropetries(prop:Array<String>, from:Dynamic, to:Dynamic):Void {
		if (!Reflect.isObject(from)) {
			var current = this.easing(cast from, cast to, time, duration);
			var lastProp:Dynamic = this.object;
			for (p in 0...prop.length - 1) {
				var x = prop[p];
				lastProp = Reflect.getProperty(lastProp, x);
			}

			#if hl
			Reflect.setProperty(lastProp, prop[prop.length - 1], cast(current, Float));
			#else
			var fromType:Type.ValueType = Type.typeof(from);
			if (fromType == TInt) {
				Reflect.setProperty(lastProp, prop[prop.length - 1], cast Std.int(current));
			} else {
				Reflect.setProperty(lastProp, prop[prop.length - 1], cast current);
			}
			#end
		} else {
			var fromFields = Reflect.fields(from);
			var toFields = Reflect.fields(to);
			var lastProp:Dynamic = this.object;
			for (p in prop) {
				lastProp = Reflect.getProperty(lastProp, p);
			}
			var objectsField = Reflect.fields(lastProp);

			var fields:Array<String> = fromFields.filter(function(val:String):Bool {
				if (toFields.contains(val) && objectsField.contains(val))
					return true;
				return false;
			});
			for (field in fields) {
				prop.push(field);
				var f = Reflect.getProperty(from, field);
				var t = Reflect.getProperty(to, field);
				updatePropetries(prop, f, t);
				prop.pop();
			}
		}
	}
}
