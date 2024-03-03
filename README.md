![Branding](./extra/branding.png)
-----

Simple tweening system for general purpose usage, using `Reflection` API can change the objects and their data easier.

### Example
An example usage of `Blastween`:

```haxe
package;

import blastween.UpdateManager;
import blastween.Blastween;

typedef Point = {
	var x : Float;
	var y : Float;
}

class Main {
	public static function Main() {
		var point : Point = { x: 0, y: 0 };
		var updater : UpdateManager = new UpdateManager();
		
		Blastween.tween(updater, point, { x: 0.0, y: 0.0 }, { x: 10.0, y: 2.0 }, 2).start();

		updater.updateAll( 0.5 ); // will update by 0.5 second
		// point.x == 2.5 point.y == 0.5
	}
}
```

**Please Note: `from` properties of a `Float` should always be `Float` constant.**
