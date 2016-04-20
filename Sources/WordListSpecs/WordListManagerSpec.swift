import WordList
import Swiftest

class WordListManagerSpec: Swiftest.Spec {
	let spec = describe("word list logic") {
		describe("#getRandomWord") {
			it("returns a random word from the dictionary") {
				let wordListManager = WordListManager(words: words)
				let word = wordListManager.getRandomWord()
				expect(wordListManager.words).to.contain(word)
			}
		}
	}
}
