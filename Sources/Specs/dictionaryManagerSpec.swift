import Dictionary
import Swiftest

class DictionaryManagerSpec: Swiftest.Spec {
  	let spec = describe("dictionary logic") {
        let dm = DictionaryManager()

        describe("#getRandomIndex") {
        	it("returns a random number through dictionary length") {
                	let index = dm.getRandomIndex()
                	expect(index).to.beLessThan(words.count)
           	}
        }

        describe("#getRandomWord") {
        	it("returns a random word from the dictionary") {
                	let gameWords = words
        		let word = dm.getRandomWord()
        			expect(gameWords).to.contain(word)
        		}
        	}
  	}
}
