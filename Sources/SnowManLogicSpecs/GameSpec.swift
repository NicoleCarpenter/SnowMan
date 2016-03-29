import SnowManLogic
import Swiftest

class GameSpec: Swiftest.Spec {
	let spec = describe("game logic") {
		var guessManager: GuessManager!
		var view: MockView!
		var game: Game!
		var word: String!

		before() {
			guessManager =  GuessManager(totalIncorrectGuessesAllowed: 5)
			word = "apple"
			view = MockView()
			game = Game(word: word, guessManager: guessManager, view: view)
		}

		describe("#playGame") {
			it("should display a winning message if there is a winner") {
				view.stubReceiveGuess("apple")
				game.playGame()

				expect(view.assignBlanksCalled).to.equal(true)
				expect(view.receiveGuessCalled).to.equal(true)
				expect(view.displayRemainingGuessesCalled).to.equal(true)
				expect(view.displayWinningMessageCalled).to.equal(true)
				expect(view.displayLosingMessageCalled).to.equal(false)
				expect(game.winner).to.equal(true)
				expect(game.gameOver).to.equal(true)
			}

			it("should display a losing message if there is not a winner") {
				view.stubReceiveGuess("b")
				game.playGame()

				expect(view.assignBlanksCalled).to.equal(true)
				expect(view.receiveGuessCalled).to.equal(true)
				expect(view.displayRemainingGuessesCalled).to.equal(true)
				expect(view.displayWinningMessageCalled).to.equal(false)
				expect(view.displayLosingMessageCalled).to.equal(true)
				expect(game.winner).to.equal(false)
				expect(game.gameOver).to.equal(true)
			}
			
			it("should display a losing message if the game is over before the player has made a move") {
				game.gameOver = true
				game.playGame()

				expect(view.assignBlanksCalled).to.equal(false)
				expect(view.receiveGuessCalled).to.equal(false)
				expect(view.displayRemainingGuessesCalled).to.equal(false)
				expect(view.displayWinningMessageCalled).to.equal(false)
				expect(view.displayLosingMessageCalled).to.equal(true)
				expect(game.winner).to.equal(false)
				expect(game.gameOver).to.equal(true)
			}
		}

		describe("#isGameOver") {
			it("should return true if the final letter is guessed") {
				guessManager.correctGuesses = ["a", "p", "l", "e"]
				let guess = "x"
				game.isGameOver(guess)
				expect(game.gameOver).to.equal(true)
			}

			it("should return true if the full word is guessed") {
				guessManager.correctGuesses = ["a", "p", "l"]
				let guess = "apple"
				game.isGameOver(guess)
				expect(game.gameOver).to.equal(true)
			}

			it("should return true if no remaining guesses are left") {
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
