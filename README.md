![Branding](./extra/branding.png)
-----
[![Building And Testing](https://github.com/nevergarden/blastween/actions/workflows/main.yml/badge.svg)](https://github.com/nevergarden/blastween/actions/workflows/main.yml)  
Simple tweening system for general purpose usage, using `Reflection` API can change the objects and their data easier.

### Example
An example usage of `Blastween`:

```haxe
package;

import blastween.Blastween;

typedef Point = {
	var x : Float;
	var y : Float;
}

class Main {
	public static function Main() {
		var point : Point = { x: 0, y: 0 };
		
		var tween = Blastween.tween(point, { x: 0.0, y: 0.0 }, { x: 10.0, y: 2.0 }, 2).start();

		tween.update( 0.5 ); // will update by 0.5 second
		// point.x == 2.5 point.y == 0.5
	}
}
```

**Please Note: `from` properties of a `Float` should always be `Float` constant.**
