import SnowManLogic
import Swiftest

class GuessManagerSpec: Swiftest.Spec {
  	let spec = describe("guess logic") {
        let guessManager = GuessManager()
        describe("#findUnguessedLetters") {
            it("should return an array of letters in the word that have not been guessed") {
                let letters = ["a", "p", "l", "e"]
                guessManager.correctGuesses = ["a", "p"]
                expect(guessManager.findUnguessedLetters(letters)).to.equal(["l", "e"])
            }
        }
  	}
}
