public class GameSetup {
	let view: Viewable

	public init(view: Viewable) {
		self.view = view
	}

	public func getMaxNumberOfGuesses() -> Int {
		view.promptMaxNumberOfGuesses()
		return Int(view.receiveMaxNumberOfGuesses())
	}
}