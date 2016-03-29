import SnowManLogic
import Swiftest

class GameSpec: Swiftest.Spec {
	let spec = describe("game logic") {
		var guessManager: GuessManager!
		var word: String!
		var io: MockIO!
		var view: View!
		var game: Game!

		before() {
			guessManager =  GuessManager(totalIncorrectGuessesAllowed: 5)
			word = "apple"
			io = MockIO()
			view = View(io: io)
			game = Game(word: word, guessManager: guessManager, view: view)
		}

		describe("#isGameOver") {
			it( "should return true if the final letter is guessed") {
				guessManager.correctGuesses = ["a", "p", "l", "e"]
				let guess = "x"
				game.isGameOver(guess)
				expect(game.gameOver).to.equal(true)
			}

			it( "should return true if the full word is guessed") {
				guessManager.correctGuesses = ["a", "p", "l"]
				let guess = "apple"
				game.isGameOver(guess)
				expect(game.gameOver).to.equal(true)
			}

			it( "should return true if no remaining guesses are left") {
				guessManager.incorrectGuesses = ["c", "b", "d", "f", "g"]
				let guess = "x"
				game.isGameOver(guess)
				expect(game.gameOver).to.equal(true)
			}
            
			it("should return false if there is not a winner and there are remaining guesses") {
				guessManager.correctGuesses = ["a"]
				guessManager.incorrectGuesses = ["b"]
				let guess = "x"
				game.isGameOver(guess)
				expect(game.gameOver).to.equal(false)
			}
		}

		describe("#isWinner") {
			it("should return true if winning condition is met") {
				guessManager.correctGuesses = ["a", "p", "l", "e"]
				let guess = "x"
				game.isWinner(guess)
				expect(game.winner).to.equal(true)
			}

			it("should return false if winning condition is not met") {
				guessManager.correctGuesses = ["a", "p"]
				let guess = "x"
				game.isWinner(guess)
				expect(game.winner).to.equal(false)
			}
		}
	}
}
