package;

import tink.testrunner.Assertion;
import tink.testrunner.Assertions;
import tink.core.Error;
import haxe.Exception;
import tink.unit.Assert;
import blastween.UpdateManager;
import blastween.Blastween;
import tink.CoreApi.Noise;
import blastween.TweenObject;
import tink.testrunner.Batch;
import tink.testrunner.Runner;
import tink.unit.TestBatch;

typedef TweenTestType = {
	var integer:Int;
	var float:Float;
	var ?typein:TweenTestType;
}

class TweenTestClass {
	public var integer : Int;
	public var float : Float;

	public function new(integer:Int, float:Float) {
		this.integer = integer;
		this.float = float;
	}
}

@:await
class TestLinear {
	private var updateManager:UpdateManager;
	private var typeTweenData:TweenTestType;
	private var	classTweenData:TweenTestClass;
	private var typeTweenObject:TweenObject;

	public function new() {
		this.updateManager = new UpdateManager();
	}

	@:setup
	public function setup():Noise {
		this.typeTweenData = {
			integer: 0,
			float: 0,
		};
		this.classTweenData = new TweenTestClass(0, 0);
		return Noise;
	}

	@:describe("Test type data change.")
	public function testTypeUpdate():Assertions {
		this.typeTweenObject = Blastween.tween(this.updateManager, typeTweenData, {integer: 0, float: 0.0}, {integer: 1, float: 1.0}, 2.0).start();
		var assertions:Array<Assertion> = [];
		try {
			updateManager.updateAll(0.4);
			assertions.push(Assert.assert(typeTweenData.integer == 0));
			assertions.push(Assert.assert(typeTweenData.float == 0.2));

			updateManager.updateAll(0.6);
			assertions.push(Assert.assert(typeTweenData.integer == 0));
			assertions.push(Assert.assert(typeTweenData.float == 0.5));

			updateManager.updateAll(1.0);
			assertions.push(Assert.assert(typeTweenData.integer == 1));
			assertions.push(Assert.assert(typeTweenData.float == 1.0));

			updateManager.updateAll(1.0);
			assertions.push(Assert.assert(typeTweenData.integer == 1));
			assertions.push(Assert.assert(typeTweenData.float == 1.0));
		} catch (e:Exception) {
			return Assert.fail(new Error(InternalError, e.message));
		}
		return assertions;
	}

	@:describe("Test class data change.")
	public function testClassUpdate():Assertions {
		this.typeTweenObject = Blastween.tween(this.updateManager, classTweenData, {integer: 0, float: 0.0}, {integer: 1, float: 1.0}, 2.0).start();
		var assertions:Array<Assertion> = [];
		try {
			updateManager.updateAll(0.4);
			assertions.push(Assert.assert(classTweenData.integer == 0));
			assertions.push(Assert.assert(classTweenData.float == 0.2));

			updateManager.updateAll(0.6);
			assertions.push(Assert.assert(classTweenData.integer == 0));
			assertions.push(Assert.assert(classTweenData.float == 0.5));

			updateManager.updateAll(1.0);
			assertions.push(Assert.assert(classTweenData.integer == 1));
			assertions.push(Assert.assert(classTweenData.float == 1.0));

			updateManager.updateAll(1.0);
			assertions.push(Assert.assert(classTweenData.integer == 1));
			assertions.push(Assert.assert(classTweenData.float == 1.0));
		} catch (e:Exception) {
			return Assert.fail(new Error(InternalError, e.message));
		}
		return assertions;
	}
}

class RunTests {
	public static function main() {
		var testBatch:tink.testrunner.Batch = TestBatch.make([new TestLinear()]);

		Runner.run(testBatch).handle(tink.testrunner.Runner.exit);
	}
}
