public class Guess {
	public var currentGuess: String

	public init(currentGuess: String) {
		self.currentGuess = currentGuess
	}

	public func isValid() -> Bool {
		return currentGuess != "" && hasOnlyLetters()
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
		return currentGuess == word
	}

	private func hasGuessInWord(word: String) -> Bool {
		return word.lowercaseString.characters.contains(Character(currentGuess))
	}

	private func hasOnlyLetters() -> Bool {
   		for character in currentGuess.characters {
  			if (!(character >= "a" && character <= "z")) {
				return false
  			}
   		}
   		return true
	}
}
