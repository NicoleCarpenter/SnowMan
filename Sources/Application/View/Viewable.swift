public protocol Viewable {
	func promptMaxNumberOfGuesses()
	func receiveMaxNumberOfGuesses() -> Int
	func receiveGuess() -> Guess
	func displayImage(image: [String], remainingGuesses: Int, maxNumberOfGuesses: Int)
	func displayBlanks(gameWord: String, correctGuesses: [String])
	func displayRemainingGuesses(remainingGuesses: Int)
	func displayIncorrectGuesses(incorrectGuesses: [String])
	func displayWinningMessage(word: String)
	func displayLosingMessage(word: String)
	func clearScreen()
}
