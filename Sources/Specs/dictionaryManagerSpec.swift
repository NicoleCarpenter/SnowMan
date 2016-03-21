import Dictionary
import Swiftest

class DictionaryManagerSpec: Swiftest.Spec {
	let spec = describe("dictionary logic") {
	var dictionaryManager: DictionaryManager!
	before() {
		dictionaryManager = DictionaryManager()
	}

		describe("#getRandomWord") {
			var gameWords: [String]!
			var word: String!
			before() {
				gameWords = words
				word = dictionaryManager.getRandomWord()
			}
			it("returns a random word from the dictionary") {
				expect(gameWords).to.contain(word)
			}
		}
	}
}
