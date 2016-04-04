public protocol Viewable {
	func promptMaxNumberOfGuesses()
	func receiveMaxNumberOfGuesses() -> Int
	func receiveGuess() -> String
	func assignBlanks(gameWord: String, correctGuesses: [String])
	func displayRemainingGuesses(remainingGuesses: Int)
	func displayWinningMessage(word: String)
	func displayLosingMessage(word: String)
}
