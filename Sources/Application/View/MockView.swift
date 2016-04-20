public class MockView: Viewable {
	public var promptMaxNumberOfGuessesCalled: Bool
	public var receiveMaxNumberOfGuessesCalled: Bool
	public var promptWordSelectionTypeCalled: Bool
	public var receiveSelectionTypeCalled: Bool
	public var promptReceiveWordCalled: Bool
	public var receiveWordCalled: Bool
	public var receiveGuessCalled: Bool
	public var displayImageCalled: Bool
	public var displayBlanksCalled: Bool
	public var displayRemainingGuessesCalled: Bool
	public var displayIncorrectGuessesCalled: Bool
	public var displayWinningMessageCalled: Bool
	public var displayLosingMessageCalled: Bool
	public var clearScreenCalled: Bool
	public var receiveMaxNumberOfGuessesReturn: Int!
	public var receiveSelectionTypeReturn: Int!
	public var receiveWordReturn: String!
	public var receiveGuessReturn: String!

	public init() {
		promptMaxNumberOfGuessesCalled = false
		receiveMaxNumberOfGuessesCalled = false
		promptWordSelectionTypeCalled = false
		receiveSelectionTypeCalled = false
		promptReceiveWordCalled = false
		receiveWordCalled = false
		receiveGuessCalled = false
		displayImageCalled = false
		displayBlanksCalled = false
		displayRemainingGuessesCalled = false
		displayIncorrectGuessesCalled = false
		displayWinningMessageCalled = false
		displayLosingMessageCalled = false
		clearScreenCalled = true
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

	public func promptWordSelectionType() {
		promptWordSelectionTypeCalled = true
	}

	public func receiveSelectionType(numberOfOptions: Int) -> Int {
		receiveSelectionTypeCalled = true
		return receiveSelectionTypeReturn
	}

	public func stubReceiveSelectionType(receiveSelectionTypeReturn: String) {
		self.receiveSelectionTypeReturn = Int(receiveSelectionTypeReturn)
	}

	public func promptReceiveWord() {
		promptReceiveWordCalled = true
	}

	public func receiveWord() -> String {
		receiveWordCalled = true
		return receiveWordReturn
	}

	public func stubReceiveWord(receiveWordReturn: String) {
		self.receiveWordReturn = receiveWordReturn
	}

	public func receiveGuess() -> String {
		receiveGuessCalled = true
		return receiveGuessReturn
	}

	public func stubReceiveGuess(receiveGuessReturn: String) {
		self.receiveGuessReturn = receiveGuessReturn
	}

	public func displayImage(image: [String], remainingGuesses: Int, maxNumberOfGuesses: Int) {
		displayImageCalled = true
	}

	public func displayBlanks(gameWord: String, correctGuesses: [String]) {
		displayBlanksCalled = true
	}

	public func displayRemainingGuesses(remainingGuesses: Int) {
		displayRemainingGuessesCalled = true
	}

	public func displayIncorrectGuesses(incorrectGuesses: [String]) {
		displayIncorrectGuessesCalled = true
	}

	public func displayWinningMessage(word: String) {
		displayWinningMessageCalled = true
	}

	public func displayLosingMessage(word: String) {
		displayLosingMessageCalled = true
	}

	public func clearScreen() {
		clearScreenCalled = true
	}
}
