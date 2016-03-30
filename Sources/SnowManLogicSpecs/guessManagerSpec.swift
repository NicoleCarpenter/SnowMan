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
                        let guess = "hello"
                    		expect(guessManager.isGuessingFullWord(guess)).to.equal(true)
                	}

                	it("should return false if guess is only 1 character") {
                        let guess = "h"
                    		expect(guessManager.isGuessingFullWord(guess)).to.equal(false)   
                	}

                  	it("should return false if guess is 0 characters") {
                        let guess = ""
                      		expect(guessManager.isGuessingFullWord(guess)).to.equal(false)
                  	}
            	}

            	describe("#correctlyGuessedFullWord") {
                	var word: String!
                	before() {
                    	word = "apple"
                	}

                	it("should return true if full word is guessed") {
                    	let guess = "apple"
                    		expect(guessManager.correctlyGuessedFullWord(word, guess: guess)).to.equal(true)
                	}

                	it("should return false if only part of the word is guessed") {
                    	let guess = "app"
                    		expect(guessManager.correctlyGuessedFullWord(word, guess: guess)).to.equal(false)
                      	}

                    	it("should return false if the guess is incorrect") {
                    	let guess = "banana"
                    		expect(guessManager.correctlyGuessedFullWord(word, guess: guess)).to.equal(false)
                	}
            	}

                describe("#appendWordPlaceholder") {
			var word: String!
                     	var placeholder: String!
			before() {
                        	word = "apple"
                            	placeholder = "#"
                    	}

                    	it("should add a placeholder to correctGuesses collection if the word is guessed") {
                        let guess = "apple"
                        	guessManager.appendWordPlaceholder(word, guess: guess)
                        	expect(guessManager.correctGuesses).to.contain(placeholder)
                  	}

                  	it("should not add a placeholder to incorrectGuesses collection the word is guessed") {
                        let guess = "apple"
                        	guessManager.appendWordPlaceholder(word, guess: guess)
                        	expect(guessManager.incorrectGuesses).notTo.contain(placeholder)
                  	}

                  	it("should add a placeholder to incorrectGuesses collection if the word is not guessed") {
                        let guess = "banana"
                        	guessManager.appendWordPlaceholder(word, guess: guess)
                        	expect(guessManager.incorrectGuesses).to.contain(placeholder)
                  	}

                  	it("should not add a placeholder to correctGuesses collection if the word is not guessed") {
                        let guess = "banana"
                        	guessManager.appendWordPlaceholder(word, guess: guess)
                        	expect(guessManager.correctGuesses).notTo.contain(placeholder)
                  	}
                } 

            	describe("#appendGuess") {
                	var word: String!
                	before() {
                    		word = "apple"
                	}
                
                	it("should add guess to correctGuesses collection if it is in the word") {
                    	let guess = "a"
                    		guessManager.appendGuess(word, guess: guess)
                    		expect(guessManager.correctGuesses).to.contain(guess)
                	}

                	it("should not add guess to incorrectGuesses collection if it is in the word") {
                    	let guess = "a"
                    		guessManager.appendGuess(word, guess: guess)
                    		expect(guessManager.incorrectGuesses).notTo.contain(guess)
                	}

                	it("should add guess to incorrectGuesses collection if it is not in the word") {
                    	let guess = "b"
                    		guessManager.appendGuess(word, guess: guess)
                    		expect(guessManager.incorrectGuesses).to.contain(guess)
                	}

                	it("should not add guess to correctGuesses collection if it is not in the word") {
                    	let guess = "b"
                    		guessManager.appendGuess(word, guess: guess)
                    		expect(guessManager.correctGuesses).notTo.contain(guess)
                	}
	    	}
	}
}
