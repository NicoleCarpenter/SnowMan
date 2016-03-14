import SnowManLogic
import Swiftest

class GameSpec: Swiftest.Spec {
  	let spec = describe("game logic") {
    	describe("#getRandomWord") {
    		let game = Game()

    		it("returns a word from the dictionary") {
    			let words = ["dance", "skip", "jump", "shark", "chicken", "alligator"]
    			let word = game.getRandomWord()
    			expect(words).to.contain(word)
    		}
    	}

  	}
}
