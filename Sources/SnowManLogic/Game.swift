import Dictionary

public class Game {
	let dictionary: DictionaryManager
	let view: View

	var correctGuesses: [String] = []
	var gameWord: String = ""

	public init(dictionary: DictionaryManager, view: View) {
		self.dictionary = dictionary
		self.view = view
	}

	public func getWord() -> String {
		gameWord = dictionary.getRandomWord()
		return gameWord
	}
}