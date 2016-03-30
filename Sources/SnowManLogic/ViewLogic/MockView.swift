public class MockView: Viewable {
	public var receiveGuessCalled: Bool
	public var assignBlanksCalled: Bool
	var receiveGuessReturn: String!
	public var displayRemainingGuessesCalled: Bool
	public var displayWinningMessageCalled: Bool
	public var displayLosingMessageCalled: Bool

	public init() {
		receiveGuessCalled = false
		assignBlanksCalled = false
		displayRemainingGuessesCalled = false
		displayWinningMessageCalled = false
		displayLosingMessageCalled = false
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

	public func displayRemainingGuesses(remainingGuesses: Int) {
		displayRemainingGuessesCalled = true
	}

	public func displayWinningMessage(word: String) {
		displayWinningMessageCalled = true
	}

	public func displayLosingMessage(word: String) {
		displayLosingMessageCalled = true
	}
}
