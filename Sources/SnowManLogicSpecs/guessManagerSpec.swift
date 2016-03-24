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
                    expect(guessManager.isGuessingFullWord("hello")).to.equal(true)
                }

                it("should return false if guess is only 1 character") {
                    expect(guessManager.isGuessingFullWord("h")).to.equal(false)   
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

                it("should return true if full word is not guessed") {
                    var guess = "app"
                    expect(guessManager.correctlyGuessedFullWord(word, guess: guess)).to.equal(false)
                    
                    guess = "banana"
                    expect(guessManager.correctlyGuessedFullWord(word, guess: guess)).to.equal(false)
                }
            }

            describe("#appendGuess") {
                var word: String!
                before() {
                    word = "apple"
                }
                
                it("should add guess to correctGuesses collection if it is in the word") {
                    let guess: Character = "a"
                    guessManager.appendGuess(word, guess: guess)
                    expect(guessManager.correctGuesses).to.contain(String(guess))
                }

                it("should not add guess to incorrectGuesses collection if it is in the word") {
                    let guess: Character = "a"
                    guessManager.appendGuess(word, guess: guess)
                    expect(guessManager.incorrectGuesses).notTo.contain(String(guess))
                }

                it("should add guess to incorrectGuesses collection if it is not in the word") {
                    let guess: Character = "b"
                    guessManager.appendGuess(word, guess: guess)
                    expect(guessManager.incorrectGuesses).to.contain(String(guess))
                }

                it("should not add guess to correctGuesses collection if it is not in the word") {
                    let guess: Character = "b"
                    guessManager.appendGuess(word, guess: guess)
                    expect(guessManager.correctGuesses).notTo.contain(String(guess))
                }
            }

            
	}
}
