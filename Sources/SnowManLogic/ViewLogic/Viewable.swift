public protocol Viewable {
	func receiveGuess() -> String
	func assignBlanks(gameWord: String, correctGuesses: [String])
	func displayRemainingGuesses(remainingGuesses: Int)
	func displayWinningMessage(word: String)
	func displayLosingMessage(word: String)
}
