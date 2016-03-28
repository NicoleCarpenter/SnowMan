public protocol Viewable {
	func receiveGuess() -> String
	func assignBlanks(gameWord: String, correctGuesses: [String]) -> String
}
