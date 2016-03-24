public class Game {
	var word: String
	var guessManager: GuessManager
	var view: Viewable

	public init(word: String, guessManager: GuessManager, view: Viewable) {
		self.word = word
		self.guessManager = guessManager
		self.view = view
	}

	public func hasGuessInWord(guess: Character) -> Bool {
		return word.lowercaseString.characters.contains(guess)
	}

	public func isWinner() -> Bool {
		let letters = separateLetters()
		return guessManager.determineUnguessedLetters(letters).isEmpty
	}

	public func gameIsOver() -> Bool {
		return guessManager.hasNoGuessesRemaining() || isWinner()
	}
	
	private func separateLetters() -> [String] {
		return word.characters.map { String($0) }
	}
}