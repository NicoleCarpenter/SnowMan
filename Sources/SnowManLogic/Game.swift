public class Game {
	var word: String

	public init(word: String) {
		self.word = word
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