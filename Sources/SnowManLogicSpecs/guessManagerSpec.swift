import SnowManLogic
import Swiftest

class GuessManagerSpec: Swiftest.Spec {
  	let spec = describe("guess logic") {
	        var guessManager: GuessManager!
        	before() {
        		guessManager = GuessManager(totalIncorrectGuessesAllowed: 5)
       		}
    
    		describe("#determineUnguessedLetters") {
            		var letters: [String]!
            		before() {
        			letters = ["a", "p", "l", "e"]
            		}

    			it("should return a set of letters in the word that have not been guessed") {
    				guessManager.correctGuesses = ["a", "p"]
    				expect(guessManager.determineUnguessedLetters(letters)).to.equal(["l", "e"])
   			}

    			it("should return an empty set if all letters have been guessed") {
    				guessManager.correctGuesses = ["a", "p", "l", "e"]
    				expect(guessManager.determineUnguessedLetters(letters)).to.equal([])
    			}

    			it("should return the full set of letters if no correct guesses have been made") {
    				guessManager.correctGuesses = []
    				expect(guessManager.determineUnguessedLetters(letters)).to.equal(["a", "p", "l", "e"])
    			}
    		}

    		describe("#outOfGuesses") {
    			it("should return true if no guesses remain") {
    				guessManager.incorrectGuesses = ["c", "b", "d", "f", "g"]
    				expect(guessManager.outOfGuesses()).to.equal(true)
    			}

    			it("should return false if there are still remaining guesses") {
    				guessManager.incorrectGuesses = ["c"]
    				expect(guessManager.outOfGuesses()).to.equal(false)
    			}
    		}
	}
}
