public class MockView: Viewable {
	public var promptMaxNumberOfGuessesCalled: Bool
	public var receiveMaxNumberOfGuessesCalled: Bool
	public var receiveGuessCalled: Bool
	public var assignBlanksCalled: Bool
	public var displayRemainingGuessesCalled: Bool
	public var displayWinningMessageCalled: Bool
	public var displayLosingMessageCalled: Bool
	public var receiveMaxNumberOfGuessesReturn: Int!
	public var receiveGuessReturn: String!

	public init() {
		promptMaxNumberOfGuessesCalled = false
		receiveMaxNumberOfGuessesCalled = false
		receiveGuessCalled = false
		assignBlanksCalled = false
		displayRemainingGuessesCalled = false
		displayWinningMessageCalled = false
		displayLosingMessageCalled = false
	}

	public func promptMaxNumberOfGuesses() {
		self.promptMaxNumberOfGuessesCalled = true
	}

	public func receiveMaxNumberOfGuesses() -> Int {
		receiveMaxNumberOfGuessesCalled = true
		return receiveMaxNumberOfGuessesReturn
	}

	public func stubReceiveMaxNumberOfGuesses(receiveMaxNumberOfGuessesReturn: String) {
		self.receiveMaxNumberOfGuessesReturn = Int(receiveMaxNumberOfGuessesReturn)
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
