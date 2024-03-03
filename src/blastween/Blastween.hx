package blastween;

class Blastween {
	public static function tween(updater:UpdateManager, object:Dynamic, from:Dynamic, to:Dynamic, duration:Float):TweenObject {
		var objFields = Reflect.fields(object);
		var fromFields = Reflect.fields(from);
		var toFields = Reflect.fields(to);

		var fields:Array<String> = fromFields.filter(function(val:String):Bool {
			if (toFields.contains(val) && objFields.contains(val))
				return true;
			return false;
		});

		var updateMap:Map<String, Tuple<Dynamic, Dynamic>> = new Map();
		for (field in fields) {
			var from:Dynamic = Reflect.getProperty(from, field);
			var to:Dynamic = Reflect.getProperty(to, field);
			updateMap.set(field, new Tuple(from, to));
		}

		return new TweenObject(updater, object, updateMap, duration);
	}
}
