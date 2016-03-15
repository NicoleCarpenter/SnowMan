import Dictionary
import Swiftest

class DictionaryManagerSpec: Swiftest.Spec {
  	let spec = describe("dictionary logic") {
    	describe("#getRandomWord") {
    		let dm = DictionaryManager()

    		it("returns a word from the dictionary") {
                let gameWords = words
    			let word = dm.getRandomWord()
    			expect(gameWords).to.contain(word)
    		}
    	}
  	}
}
