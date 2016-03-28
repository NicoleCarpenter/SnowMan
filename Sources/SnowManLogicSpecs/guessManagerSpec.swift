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

    		describe("#hasNoGuessesRemaining") {
    			it("should return true if no guesses remain") {
    				guessManager.incorrectGuesses = ["c", "b", "d", "f", "g"]
    				expect(guessManager.hasNoGuessesRemaining()).to.equal(true)
    			}

    			it("should return false if there are still remaining guesses") {
    				guessManager.incorrectGuesses = ["c"]
    				expect(guessManager.hasNoGuessesRemaining()).to.equal(false)
    			}
    		}

	        describe("#calculateRemainingGuesses") {
        	        it("should return the number of guesses allowed if no incorrect guesses have been made") {
                		guessManager.incorrectGuesses = []
                    		expect(guessManager.calculateRemainingGuesses()).to.equal(5)
                	}

                	it("should return the difference between guesses allowed and incorrect guesses") {
                    		guessManager.incorrectGuesses = ["c", "b"]
                    		expect(guessManager.calculateRemainingGuesses()).to.equal(3)
                	}

                	it("should return the difference between guesses allowed and incorrect guesses") {
                    		guessManager.incorrectGuesses = ["c", "b", "d", "f", "g", "h"]
                    		expect(guessManager.calculateRemainingGuesses()).to.equal(-1)
                	}
            	}

            	describe("#isGuessingFullWord") {
                	it("should return true if guess is more than 1 character") {
                        guessManager.guess = "hello"
                    		expect(guessManager.isGuessingFullWord()).to.equal(true)
                	}

                	it("should return false if guess is only 1 character") {
                    guessManager.guess = "h"
                    		expect(guessManager.isGuessingFullWord()).to.equal(false)   
                	}

                  it("should return false if guess is 0 characters") {
                      guessManager.guess = ""
                      expect(guessManager.isGuessingFullWord()).to.equal(false)
                  }
            	}

            	describe("#correctlyGuessedFullWord") {
                	var word: String!
                	before() {
                    	word = "apple"
                	}

                	it("should return true if full word is guessed") {
                    		guessManager.guess = "apple"
                    		expect(guessManager.correctlyGuessedFullWord(word)).to.equal(true)
                	}

                	it("should return false if only part of the word is guessed") {
                    		guessManager.guess = "app"
                    		expect(guessManager.correctlyGuessedFullWord(word)).to.equal(false)
                      }

                    it("should return false if the guess is incorrect") {
                    		guessManager.guess = "banana"
                    		expect(guessManager.correctlyGuessedFullWord(word)).to.equal(false)
                	}
            	}

                describe("#appendWordPlaceholder") {
			var word: String!
			before() {
                        	word = "apple"
                    	}

                    	it("should add a placeholder to correctGuesses collection if the word is guessed") {
                        	guessManager.guess = "apple"
                        	guessManager.appendWordPlaceholder(word)
                        	expect(guessManager.correctGuesses).to.contain("#")
                  	}

                  	it("should not add a placeholder to incorrectGuesses collection the word is guessed") {
                        	guessManager.guess = "apple"
                        	guessManager.appendWordPlaceholder(word)
                        	expect(guessManager.incorrectGuesses).notTo.contain(guessManager.guess)
                  	}

                  	it("should add a placeholder to incorrectGuesses collection if the word is not guessed") {
                        	guessManager.guess = "banana"
                        	guessManager.appendWordPlaceholder(word)
                        	expect(guessManager.incorrectGuesses).to.contain("#")
                  	}

                  	it("should not add a placeholder to correctGuesses collection if the word is not guessed") {
                        	guessManager.guess = "banana"
                        	guessManager.appendWordPlaceholder(word)
                        	expect(guessManager.correctGuesses).notTo.contain(guessManager.guess)
                  	}
                } 

            	describe("#appendGuess") {
                	var word: String!
                	before() {
                    		word = "apple"
                	}
                
                	it("should add guess to correctGuesses collection if it is in the word") {
                    		guessManager.guess = "a"
                    		guessManager.appendGuess(word)
                    		expect(guessManager.correctGuesses).to.contain(guessManager.guess)
                	}

                	it("should not add guess to incorrectGuesses collection if it is in the word") {
                    		guessManager.guess = "a"
                    		guessManager.appendGuess(word)
                    		expect(guessManager.incorrectGuesses).notTo.contain(guessManager.guess)
                	}

                	it("should add guess to incorrectGuesses collection if it is not in the word") {
                    		guessManager.guess = "b"
                    		guessManager.appendGuess(word)
                    		expect(guessManager.incorrectGuesses).to.contain(guessManager.guess)
                	}

                	it("should not add guess to correctGuesses collection if it is not in the word") {
                    		guessManager.guess = "b"
                    		guessManager.appendGuess(word)
                    		expect(guessManager.correctGuesses).notTo.contain(guessManager.guess)
                	}
	    	}
	}
}
