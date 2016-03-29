public class MockView: Viewable {
	var receiveGuessCalled: Bool
	var assignBlanksCalled: Bool
	var receiveGuessReturn: String!

	public init(io: Interactable) {
		receiveGuessCalled = false
		assignBlanksCalled = false
	}

	public func receiveGuess() -> String {
		receiveGuessCalled = true
		return receiveGuessReturn
	}

	public func stubReceiveGuess(receiveGuessReturn: String) {
		self.receiveGuessReturn = receiveGuessReturn
	}

	public func assignBlanks(gameWord: String, correctGuesses: [String]) {
		assignBlanksCalled = true
	}
}
