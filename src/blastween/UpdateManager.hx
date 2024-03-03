package blastween;

class UpdateManager {
	private final updaters:Array<IUpdater> = [];

	public function new() {}

	public function addUpdater(updater:IUpdater):Void {
		this.updaters.push(updater);
	}

	public function removeUpdater(updater:IUpdater):Void {
		this.updaters.remove(updater);
	}

	public function updateAll(dt:Float) {
		for (updater in this.updaters) {
			updater.update(dt);
		}
	}
}
