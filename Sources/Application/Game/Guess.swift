public class Guess {
	public var currentGuess: String

	public init(currentGuess: String) {
		self.currentGuess = currentGuess
	}

	public func isValid() -> Bool {
		return !(isSpaceOrReturn()) && hasOnlyLetters()
	}

	public func isCorrect(word: String) -> Bool {
		if isFullWord() {
			return isCorrectlyGuessedFullWord(word)
		} else {
			return hasGuessInWord(word)
		}
	}

	public func isFullWord() -> Bool {
		return currentGuess.characters.count > 1
	}

	public func isCorrectlyGuessedFullWord(word: String) -> Bool {
		return currentGuess.lowercaseString == word.lowercaseString
	}

	private func hasGuessInWord(word: String) -> Bool {
		return word.lowercaseString.characters.contains(Character(currentGuess.lowercaseString))
	}

	private func hasOnlyLetters() -> Bool {
		for character in currentGuess.characters {
			if (!isValidLetter(character)) {
				return false
			}
		}
		return true
	}
	private func isSpaceOrReturn() -> Bool {
		return currentGuess == "" || currentGuess == " "
	}

	private func isValidLetter(letter: Character) -> Bool {
		return (letter >= "a" && letter <= "z") || (letter >= "A" && letter <= "Z") || letter == " "
	}
}
