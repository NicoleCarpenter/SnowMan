import Dictionary

public class Game {
	let dictionary: DictionaryManager!
	var gameWord: String = ""

	public init(dictionary: DictionaryManager) {
		self.dictionary = dictionary
	}

	public func getWord() -> String {
		gameWord = dictionary.getRandomWord()
		return gameWord
	}
}