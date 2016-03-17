import SnowManLogic
import Swiftest

class GameSpec: Swiftest.Spec {
  	let spec = describe("game logic") {
        let word = "apple"
		let game = Game(word: word)

        describe("#checkForGuessInWord") {
          	it("should return true if the letter is in the word") {
    	   		let guess: Character = "a"
    		    expect(game.checkForGuessInWord(guess)).to.equal(true)
        		}

		    it("should return false if the letter is not in the word") {
		  	    let guess: Character = "b"
			    expect(game.checkForGuessInWord(guess)).to.equal(false)
        	}    
        }
  	}
}
