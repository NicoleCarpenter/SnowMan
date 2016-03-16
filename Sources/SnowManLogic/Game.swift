import Dictionary

public class Game {
	let dictionary: DictionaryManager
	let view: View

	var correctGuesses: [String] = []
	var wrongGuesses: [String] = []
	var gameWord: String = ""

	public init(dictionary: DictionaryManager, view: View) {
		self.dictionary = dictionary
		self.view = view
	}

	public func getWord() -> String {
		gameWord = dictionary.getRandomWord()
		return gameWord
	}

	public func checkIfGuessingFullWord(guess: String) -> Bool {
		if (guess.characters.count > 1) {
			return true
		} else {
			return false
		}
	}

	public func checkForGuessInWord(guess: Character, gameWord: String) -> Bool {
		if (gameWord.lowercaseString.characters.contains(guess)) {
			return true
		} else {
			return false
		}
	}
}