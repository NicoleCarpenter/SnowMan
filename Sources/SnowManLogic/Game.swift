public class Game {
	var word: String
	var guessManager: GuessManager

	public init(word: String, guessManager: GuessManager) {
		self.word = word
		self.guessManager = guessManager
	}

	public func checkForGuessInWord(guess: Character) -> Bool {
		if (word.lowercaseString.characters.contains(guess)) {
			return true
		} else {
			return false
		}
	}

	public func separateLetters() -> [String] {
		return word.characters.map { String($0) }
	}
}