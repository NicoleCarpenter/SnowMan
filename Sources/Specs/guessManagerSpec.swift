import SnowManLogic
import Swiftest

class GuessManagerSpec: Swiftest.Spec {
  	let spec = describe("guess logic") {
        let guessManager = GuessManager()
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
  	}
}
