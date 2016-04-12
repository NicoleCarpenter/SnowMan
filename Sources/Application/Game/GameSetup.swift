public class GameSetup {
	let view: Viewable

	public init(view: Viewable) {
		self.view = view
	}

	public func getMaxNumberOfGuesses() -> Int {
		view.clearScreen()
		view.promptMaxNumberOfGuesses()
		return Int(view.receiveMaxNumberOfGuesses())
	}
}
