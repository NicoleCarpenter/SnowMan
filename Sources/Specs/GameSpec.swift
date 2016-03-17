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

        describe("#checkIfGuessingFullWord") {
          	it("should return true if guessing the word") {
        	   		let guess = "word"
        		  	expect(game.checkIfGuessingFullWord(guess)).to.equal(true)
        		}

        		it("should return false if guessing a letter") {
        		  	let guess = "p"
        			  expect(game.checkIfGuessingFullWord(guess)).to.equal(false)
        		}
        }

        describe("#checkForGuessInWord") {
          	it("should return true if the letter is in the word") {
        	   		let guess: Character = "a"
        		  	let gameWord = "apple"
        		    expect(game.checkForGuessInWord(guess, gameWord: gameWord)).to.equal(true)
        		}

    			  it("should return false if the letter is not in the word") {
        		  	let guess: Character = "b"
        			  let gameWord = "apple"
        			  expect(game.checkForGuessInWord(guess, gameWord: gameWord)).to.equal(false)
        		}    
        }
  	}
}
