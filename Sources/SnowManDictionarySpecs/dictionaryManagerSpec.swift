import SnowManDictionary
import Swiftest

class DictionaryManagerSpec: Swiftest.Spec {
	let spec = describe("dictionary logic") {
		describe("#getRandomWord") {
			it("returns a random word from the dictionary") {
				let dictionaryManager = DictionaryManager(words: words)
				let word = dictionaryManager.getRandomWord()
				expect(dictionaryManager.words).to.contain(word)
			}
		}
	}
}
