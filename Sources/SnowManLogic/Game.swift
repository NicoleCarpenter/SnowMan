public class Game {
	var word: String
	var guessManager: GuessManager

	public init(word: String, guessManager: GuessManager) {
		self.word = word
		self.guessManager = guessManager
	}

	public func checkForGuessInWord(guess: Character) -> Bool {
		return word.lowercaseString.characters.contains(guess)
	}

	public func separateLetters() -> [String] {
		return word.characters.map { String($0) }
	}

	public func isWinner() -> Bool {
		let letters = separateLetters()
		let unguessedLetters = guessManager.findUnguessedLetters(letters)
		return unguessedLetters.isEmpty
	}

	public func gameOver() -> Bool {
		let noGuessesRemaining = guessManager.noGuessesRemaining()
		let winner = isWinner()
		return noGuessesRemaining || winner
	}
}