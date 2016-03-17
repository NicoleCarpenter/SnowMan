import SnowManLogic
import Swiftest

class GameSpec: Swiftest.Spec {
  	let spec = describe("game logic") {
        let guessManager = GuessManager()
        let word = "apple"
        let game = Game(word: word, guessManager: guessManager)

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

        describe("#separateLetters") {
            it("should return an array of the letters in the word") {
                expect(game.separateLetters()).to.equal(["a", "p", "p", "l", "e"])
            }
        }

        describe("#isWinner") {
            it("should return true if winning condition is met") {
                guessManager.correctGuesses = ["a", "p", "l", "e"]
                expect(game.isWinner()).to.equal(true)
            }

            it("should return false if winning condition is not met") {
                guessManager.correctGuesses = ["a", "p"]
                expect(game.isWinner()).to.equal(false)
            }
        }
  	}
}
