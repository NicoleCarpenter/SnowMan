import SnowManLogic
import Swiftest

class GameSpec: Swiftest.Spec {
	let spec = describe("game logic") {
		var guessManager: GuessManager!
		var word: String!
		var io: IO!
		var view: View!
		var game: Game!

		before() {
			guessManager =  GuessManager(totalIncorrectGuessesAllowed: 5)
			word = "apple"
			io = IO()
			view = View(io: io)
			game = Game(word: word, guessManager: guessManager, view: view)
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

		describe("#gameIsOver") {
			it( "should return true if winning conditions are met") {
				guessManager.correctGuesses = ["a", "p", "l", "e"]
				expect(game.gameIsOver()).to.equal(true)
			}

			it( "should return true if no remaining guess conditions are met") {
				guessManager.incorrectGuesses = ["c", "b", "d", "f", "g", "h"]
				expect(game.gameIsOver()).to.equal(true)
			}
            
			it("should return false if there is not a winner and there are remaining guesses") {
				guessManager.correctGuesses = ["a"]
				guessManager.incorrectGuesses = ["b"]
				expect(game.gameIsOver()).to.equal(false)
			}
		}
	}
}
