import SnowManLogic
import Swiftest

class GuessManagerSpec: Swiftest.Spec {
  	let spec = describe("guess logic") {
        let guessManager = GuessManager(totalIncorrectGuessesAllowed: 10)
        
        describe("#findUnguessedLetters") {
            let letters = ["a", "p", "l", "e"]
            it("should return a set of letters in the word that have not been guessed") {
                guessManager.correctGuesses = ["a", "p"]
                expect(guessManager.findUnguessedLetters(letters)).to.equal(["l", "e"])
            }

            it("should return an empty set if all letters have been guessed") {
                guessManager.correctGuesses = ["a", "p", "l", "e"]
                expect(guessManager.findUnguessedLetters(letters)).to.equal([])
            }

            it("should return the full set of letters if no correct guesses have been made") {
                guessManager.correctGuesses = []
                expect(guessManager.findUnguessedLetters(letters)).to.equal(["a", "p", "l", "e"])
            }
        }

        describe("#calculateRemainingGuesses") {
            guessManager.totalIncorrectGuessesAllowed = 5
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

        describe("#noGuessesRemaining") {
            guessManager.totalIncorrectGuessesAllowed = 5
            it("should return true if no guesses remain") {
                guessManager.incorrectGuesses = ["c", "b", "d", "f", "g"]
                expect(guessManager.noGuessesRemaining()).to.equal(true)
            }

            it("should return false if there are still remaining guesses") {
                guessManager.incorrectGuesses = ["c"]
                expect(guessManager.noGuessesRemaining()).to.equal(false)
            }
        }



  	}
}
