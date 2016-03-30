import Application
import Swiftest

class GameSpec: Swiftest.Spec {
	let spec = describe("game logic") {
		var guessManager: GuessManager!
		var word: String!
		var view: MockView!
		var maxNumberOfGuesses: Int!
		var game: Game!

		before() {
			guessManager =  GuessManager()
			word = "apple"
			view = MockView()
			maxNumberOfGuesses = 5
			game = Game(word: word, guessManager: guessManager, view: view, maxNumberOfGuesses: maxNumberOfGuesses)
		}

		describe("#playGame") {
			it("should display a winning message if there is a winner") {
				view.stubReceiveGuess("apple")
				game.playGame()

				expect(view.assignBlanksCalled).to.equal(true)
				expect(view.receiveGuessCalled).to.equal(true)
				expect(view.displayRemainingGuessesCalled).to.equal(true)
				expect(view.displayIncorrectGuessesCalled).to.equal(true)
				expect(view.displayWinningMessageCalled).to.equal(true)
				expect(view.displayLosingMessageCalled).to.equal(false)
				expect(view.receiveGuessReturn).to.equal(Guess(currentGuess: "apple"))
				expect(game.winner).to.equal(true)
				expect(game.gameOver).to.equal(true)
			}

			it("should display a losing message if there is not a winner") {
				view.stubReceiveGuess("b")
				game.playGame()

				expect(view.assignBlanksCalled).to.equal(true)
				expect(view.receiveGuessCalled).to.equal(true)
				expect(view.displayRemainingGuessesCalled).to.equal(true)
				expect(view.displayIncorrectGuessesCalled).to.equal(true)
				expect(view.displayWinningMessageCalled).to.equal(false)
				expect(view.displayLosingMessageCalled).to.equal(true)
				expect(view.receiveGuessReturn).to.equal(Guess(currentGuess: "b"))
				expect(game.winner).to.equal(false)
				expect(game.gameOver).to.equal(true)
			}
			
			it("should display a losing message if the game is over before the player has made a move") {
				game.gameOver = true
				game.playGame()

				expect(view.assignBlanksCalled).to.equal(false)
				expect(view.receiveGuessCalled).to.equal(false)
				expect(view.displayRemainingGuessesCalled).to.equal(false)
				expect(view.displayIncorrectGuessesCalled).to.equal(false)
				expect(view.displayWinningMessageCalled).to.equal(false)
				expect(view.displayLosingMessageCalled).to.equal(true)
				expect(game.winner).to.equal(false)
				expect(game.gameOver).to.equal(true)
			}
		}

		describe("#isGameOver") {
			var maxNumberOfGuesses: Int!
			before() {
				maxNumberOfGuesses = 5
			}
			it("should return true if the final letter is guessed") {
				guessManager.correctGuesses = ["a", "p", "l", "e"]
				let guess = Guess(currentGuess: "x")
				game.isGameOver(guess)
				expect(game.gameOver).to.equal(true)
			}

			it("should return true if the full word is guessed") {
				guessManager.correctGuesses = ["a", "p", "l"]
				let guess = Guess(currentGuess: "apple")
				game.isGameOver(guess)
				expect(game.gameOver).to.equal(true)
			}

			it("should return true if no remaining guesses are left") {
				guessManager.incorrectGuesses = ["c", "b", "d", "f", "g"]
				let guess = Guess(currentGuess: "x")
				game.isGameOver(guess)
				expect(game.gameOver).to.equal(true)
			}
            
			it("should return false if there is not a winner and there are remaining guesses") {
				guessManager.correctGuesses = ["a"]
				guessManager.incorrectGuesses = ["b"]
				let guess = Guess(currentGuess: "x")
				game.isGameOver(guess)
				expect(game.gameOver).to.equal(false)
			}
		}

		describe("#isWinner") {
			it("should return true if winning condition is met") {
				guessManager.correctGuesses = ["a", "p", "l", "e"]
				let guess = Guess(currentGuess: "x")
				game.isWinner(guess)
				expect(game.winner).to.equal(true)
			}

			it("should return false if winning condition is not met") {
				guessManager.correctGuesses = ["a", "p"]
				let guess = Guess(currentGuess: "x")
				game.isWinner(guess)
				expect(game.winner).to.equal(false)
			}
		}
	}
}
