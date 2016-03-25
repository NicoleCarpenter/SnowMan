public protocol Viewable {
	func receiveGuess(getGuess: () -> String) -> String
	func assignBlanks(gameWord: String, correctGuesses: [String]) -> String
}
