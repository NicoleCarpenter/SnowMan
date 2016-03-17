public class Game {
	var correctGuesses: [String] = []
	var wrongGuesses: [String] = []
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
}