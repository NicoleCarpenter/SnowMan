public class MockView: Viewable {
	public var promptNumberOfGuessesCalled: Bool
	public var receiveNumberOfGuessesCalled: Bool
	public var receiveGuessCalled: Bool
	public var assignBlanksCalled: Bool
	public var displayRemainingGuessesCalled: Bool
	public var displayWinningMessageCalled: Bool
	public var displayLosingMessageCalled: Bool
	var receiveNumberOfGuessesReturn: Int!
	var receiveGuessReturn: String!

	public init() {
		promptNumberOfGuessesCalled = false
		receiveNumberOfGuessesCalled = false
		receiveGuessCalled = false
		assignBlanksCalled = false
		displayRemainingGuessesCalled = false
		displayWinningMessageCalled = false
		displayLosingMessageCalled = false
	}

	public func promptNumberOfGuesses() {
		self.promptNumberOfGuessesCalled = true
	}

	public func receiveNumberOfGuesses() -> Int {
		receiveNumberOfGuessesCalled = true
		return receiveNumberOfGuessesReturn
	}

	public func stubReceiveNumberOfGuesses(receiveNumberOfGuessesReturn: String) {
		self.receiveNumberOfGuessesReturn = Int(receiveNumberOfGuessesReturn)
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
