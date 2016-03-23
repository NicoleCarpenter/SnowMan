import Dictionary
import Swiftest

class DictionaryManagerSpec: Swiftest.Spec {
	let spec = describe("dictionary logic") {
		describe("#getRandomWord") {
			it("returns a random word from the dictionary") {
				let dictionaryManager = DictionaryManager()
				let word = dictionaryManager.getRandomWord()
				expect(dictionaryManager.gameWords).to.contain(word)
			}
		}
	}
}
