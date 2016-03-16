import Dictionary
import SnowManLogic
import Swiftest

class GameSpec: Swiftest.Spec {
  	let spec = describe("game logic") {
  		let dictionary = DictionaryManager()
  		let view = View()
		let game = Game(dictionary: dictionary, view: view)

    	describe("#getWord") {
    		it("should return a word from the dictionary") {
    			let word = game.getWord()
    			let gameWords = words
    			expect(gameWords).to.contain(word)
    		}
    	}
  	}
}
