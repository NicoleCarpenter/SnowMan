public protocol Viewable {
	func promptMaxNumberOfGuesses()
	func receiveMaxNumberOfGuesses() -> Int
	func promptWordSelectionType()
	func receiveSelectionType(numberOfOptions: Int) -> Int
	func promptReceiveWord()
	func receiveWord() -> String
	func receiveGuess() -> String
	func displayImage(image: [String], remainingGuesses: Int, maxNumberOfGuesses: Int)
	func displayBlanks(gameWord: String, correctGuesses: [String])
	func displayRemainingGuesses(remainingGuesses: Int)
	func displayIncorrectGuesses(incorrectGuesses: [String])
	func displayWinningMessage(word: String)
	func displayLosingMessage(word: String)
	func clearScreen()
}
