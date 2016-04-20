import Application
import Swiftest

class GameSpec: Swiftest.Spec {
	let spec = describe("game logic") {
		var guessManager: GuessManager!
		var word: String!
		var view: MockView!
		var maxNumberOfGuesses: Int!
		var guessBuilder: GuessBuilder!
		var player1: Player!
		var player2: Player!
		var players: [Player]!
		var game: Game!

		before() {
			guessManager =  GuessManager()
			word = "apple"
			view = MockView()
			maxNumberOfGuesses = 5
			guessBuilder = GuessBuilder()
			player1 = Player(name: "Player 1", order: 1, correctGuesses: [], incorrectGuesses: [])
			player2 = Player(name: "Player 2", order: 2, correctGuesses: [], incorrectGuesses: [])
			players = [player1, player2]
			game = Game(word: word, guessManager: guessManager, view: view, maxNumberOfGuesses: maxNumberOfGuesses, guessBuilder: guessBuilder, players: players)
		}

		describe("#playGame") {
			it("should display a winning message if there is a winner") {
				view.stubReceiveGuess("apple")
				game.playGame()

				expect(view.clearScreenCalled).to.equal(true)
				expect(view.displayImageCalled).to.equal(true)
				expect(view.displayBlanksCalled).to.equal(true)
				expect(view.promptPlayerTurnCalled).to.equal(true)
				expect(view.displayRemainingGuessesCalled).to.equal(true)
				expect(view.displayIncorrectGuessesCalled).to.equal(true)
				expect(view.receiveGuessCalled).to.equal(true)
				expect(view.receiveGuessReturn).to.equal("apple")
				expect(player1.correctGuesses).to.contain("apple")
				expect(view.displayWinningMessageCalled).to.equal(true)
				expect(view.displayLosingMessageCalled).to.equal(false)
				expect(game.winner).to.equal(true)
				expect(game.gameOver).to.equal(true)
			}

			it("should display a losing message if there is not a winner") {
				view.stubReceiveGuess("b")
				game.playGame()

				expect(view.clearScreenCalled).to.equal(true)
				expect(view.displayImageCalled).to.equal(true)
				expect(view.displayBlanksCalled).to.equal(true)
				expect(view.promptPlayerTurnCalled).to.equal(true)
				expect(view.displayRemainingGuessesCalled).to.equal(true)
				expect(view.displayIncorrectGuessesCalled).to.equal(true)
				expect(view.receiveGuessCalled).to.equal(true)
				expect(view.receiveGuessReturn).to.equal("b")
				expect(player1.incorrectGuesses).to.contain("b")
				expect(view.displayWinningMessageCalled).to.equal(false)
				expect(view.displayLosingMessageCalled).to.equal(true)
				expect(game.winner).to.equal(false)
				expect(game.gameOver).to.equal(true)
			}

			it("should display a losing message if the game is over before the player has made a move") {
				game.gameOver = true
				game.playGame()

				expect(view.clearScreenCalled).to.equal(true)
				expect(view.displayImageCalled).to.equal(true)
				expect(view.displayBlanksCalled).to.equal(false)
				expect(view.promptPlayerTurnCalled).to.equal(false)
				expect(view.displayRemainingGuessesCalled).to.equal(false)
				expect(view.displayIncorrectGuessesCalled).to.equal(false)
				expect(view.receiveGuessCalled).to.equal(false)
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
				player1.correctGuesses = ["a", "p", "l", "e"]
				let guess = Guess(currentGuess: "x")
				game.isGameOver(guess, correctGuesses: player1.correctGuesses)
				expect(game.gameOver).to.equal(true)
			}

			it("should return true if the full word is guessed") {
				player1.correctGuesses = ["a", "p", "l"]
				let guess = Guess(currentGuess: "apple")
				game.isGameOver(guess, correctGuesses: player1.correctGuesses)
				expect(game.gameOver).to.equal(true)
			}

			it("should return true if no remaining guesses are left for either player") {
				player1.incorrectGuesses = ["c", "b", "d", "f", "g"]
				player2.incorrectGuesses = ["c", "b", "d", "f", "g"]
				let guess = Guess(currentGuess: "x")
				game.isGameOver(guess, correctGuesses: player1.correctGuesses)
				expect(game.gameOver).to.equal(true)
			}

			it("should return false if one player is out of guesses and one has remaining guesses") {
				player1.incorrectGuesses = ["c", "b", "d", "f", "g"]
				player2.incorrectGuesses = []
				let guess = Guess(currentGuess: "x")
				game.isGameOver(guess, correctGuesses: player2.correctGuesses)
				expect(game.gameOver).to.equal(false)
			}

			it("should return false if there is not a winner and there are remaining guesses") {
				player1.correctGuesses = ["a"]
				player1.incorrectGuesses = ["b"]
				let guess = Guess(currentGuess: "x")
				game.isGameOver(guess, correctGuesses: player1.correctGuesses)
				expect(game.gameOver).to.equal(false)
			}
		}

		describe("#isWinner") {
			it("should return true if all letters are guessed") {
				let correctGuesses = ["a", "p", "l", "e"]
				let guess = Guess(currentGuess: "x")
				game.isWinner(guess, correctGuesses: correctGuesses)
				expect(game.winner).to.equal(true)
			}

			it("should return true if the word is guessed") {
				let correctGuesses = ["a"]
				let guess = Guess(currentGuess: "apple")
				game.isWinner(guess, correctGuesses: correctGuesses)
				expect(game.winner).to.equal(true)
			}

			it("should return false if winning condition is not met") {
				let correctGuesses = ["a", "p"]
				let guess = Guess(currentGuess: "x")
				game.isWinner(guess, correctGuesses: correctGuesses)
				expect(game.winner).to.equal(false)
			}
		}
	}
}
