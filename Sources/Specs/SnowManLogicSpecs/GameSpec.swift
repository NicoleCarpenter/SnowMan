import SnowManLogic
import Swiftest

class GameSpec: Swiftest.Spec {
	let spec = describe("game logic") {
		var guessManager: GuessManager!
		var word: String!
		var ui: UI!
		var view: Viewable!
		var game: Game!

		before() {
			guessManager =  GuessManager(totalIncorrectGuessesAllowed: 5)
			word = "apple"
			ui = UI()
			view = MockView(ui: ui)
			game = Game(word: word, guessManager: guessManager, view: view)
		}

		describe("#checkForGuessInWord") {
			var guess: Character!
			before() {
				guess = "a"
			}
			it("should return true if the letter is in the word") {
				expect(game.checkForGuessInWord(guess)).to.equal(true)
			}

			it("should return false if the letter is not in the word") {
				guess = "b"
				expect(game.checkForGuessInWord(guess)).to.equal(false)
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

		describe("#gameOver") {
			it( "should return true if winning conditions are met") {
				guessManager.correctGuesses = ["a", "p", "l", "e"]
				expect(game.gameOver()).to.equal(true)
			}

			it( "should return true if no remaining guess conditions are met") {
				guessManager.incorrectGuesses = ["c", "b", "d", "f", "g", "h"]
				expect(game.gameOver()).to.equal(true)
			}
            
			it("should return false if there is not a winner and there are remaining guesses") {
				guessManager.correctGuesses = ["a"]
				guessManager.incorrectGuesses = ["b"]
				expect(game.gameOver()).to.equal(false)
			}
		}
	}
}
