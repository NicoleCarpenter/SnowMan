public class Game {
	var word: String
	var guessManager: GuessManager
	var view: Viewable

	public init(word: String, guessManager: GuessManager, view: Viewable) {
		self.word = word
		self.guessManager = guessManager
		self.view = view
	}

	public func checkForGuessInWord(guess: Character) -> Bool {
		return word.lowercaseString.characters.contains(guess)
	}

	public func isWinner() -> Bool {
		let letters = separateLetters()
		let unguessedLetters = guessManager.findUnguessedLetters(letters)
		return unguessedLetters.isEmpty
	}

	public func gameOver() -> Bool {
		return guessManager.noGuessesRemaining() || isWinner()
	}
	
	private func separateLetters() -> [String] {
		return word.characters.map { String($0) }
	}
}