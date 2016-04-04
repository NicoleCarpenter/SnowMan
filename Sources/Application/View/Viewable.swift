public protocol Viewable {
	func promptNumberOfGuesses()
	func receiveNumberOfGuesses() -> Int
	func receiveGuess() -> String
	func assignBlanks(gameWord: String, correctGuesses: [String])
	func displayRemainingGuesses(remainingGuesses: Int)
	func displayWinningMessage(word: String)
	func displayLosingMessage(word: String)
}
