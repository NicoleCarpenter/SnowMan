public protocol Viewable {
	func promptNumberOfPlayers(options: [String])
	func receiveSelectionType(numberOfOptions: Int) -> Int
	func promptReceivePlayerName()
	func receivePlayerName() -> String
	func promptMaxNumberOfGuesses()
	func receiveMaxNumberOfGuesses() -> Int
	func promptWordSelectionType(options: [String])
	func promptReceiveWord()
	func receiveWord() -> String
	func promptPlayerTurn(name: String)
	func receiveGuess() -> String
	func displayImage(image: [String], remainingGuesses: Int, maxNumberOfGuesses: Int)
	func displayBlanks(gameWord: String, correctGuesses: [String])
	func displayRemainingGuesses(remainingGuesses: Int)
	func displayIncorrectGuesses(incorrectGuesses: [String])
	func displayWinningMessage(word: String)
	func displayLosingMessage(word: String)
	func clearScreen()
}
