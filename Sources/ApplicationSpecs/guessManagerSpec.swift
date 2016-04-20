import Application
import Swiftest

class GuessManagerSpec: Swiftest.Spec {
	let spec = describe("guess manager logic") {
		var guessManager: GuessManager!
		before() {
			guessManager = GuessManager()
		}

		describe("#determineUnguessedLetters") {
			var word: String!
			var correctGuesses: [String]!
			before() {
				word = "apple"
				correctGuesses = []
			}

			it("should return a set of letters in the word that have not been guessed") {
				correctGuesses = ["a", "p"]
				expect(guessManager.determineUnguessedLetters(word, correctGuesses: correctGuesses)).to.equal(["l", "e"])
			}

			it("should return an empty set if all letters have been guessed") {
				correctGuesses = ["a", "p", "l", "e"]
				expect(guessManager.determineUnguessedLetters(word, correctGuesses: correctGuesses)).to.equal([])
			}

			it("should return the full set of letters if no correct guesses have been made") {
				correctGuesses = []
				expect(guessManager.determineUnguessedLetters(word, correctGuesses: correctGuesses)).to.equal(["a", "p", "l", "e"])
			}

			it("should return the word without spaces") {
				word = "two words"
				correctGuesses = []
				expect(guessManager.determineUnguessedLetters(word, correctGuesses: correctGuesses)).to.equal(["t", "w", "o", "w", "o", "r", "d", "s"])
			}
		}

		describe("#hasNoGuessesRemaining") {
			var maxNumberOfGuesses: Int!
			var incorrectGuesses: [String]!
			before() {
				maxNumberOfGuesses = 5
				incorrectGuesses = []
			}

			it("should return true if no guesses remain") {
				incorrectGuesses = ["c", "b", "d", "f", "g"]
				expect(guessManager.hasNoGuessesRemaining(maxNumberOfGuesses, incorrectGuesses: incorrectGuesses)).to.equal(true)
			}

			it("should return false if there are still remaining guesses") {
				incorrectGuesses = ["c"]
				expect(guessManager.hasNoGuessesRemaining(maxNumberOfGuesses, incorrectGuesses: incorrectGuesses)).to.equal(false)
			}
		}

		describe("#calculateRemainingGuesses") {
			var maxNumberOfGuesses: Int!
			var incorrectGuesses: [String]!
			before() {
				maxNumberOfGuesses = 5
				incorrectGuesses = []
			}

			it("should return the number of guesses allowed if no incorrect guesses have been made") {
				incorrectGuesses = []
				expect(guessManager.calculateRemainingGuesses(maxNumberOfGuesses, incorrectGuesses: incorrectGuesses)).to.equal(5)
			}

			it("should return the difference between guesses allowed and incorrect guesses") {
				incorrectGuesses = ["c", "b"]
				expect(guessManager.calculateRemainingGuesses(maxNumberOfGuesses, incorrectGuesses: incorrectGuesses)).to.equal(3)
			}

			it("should return the difference between guesses allowed and incorrect guesses") {
				incorrectGuesses = ["c", "b", "d", "f", "g", "h"]
				expect(guessManager.calculateRemainingGuesses(maxNumberOfGuesses, incorrectGuesses: incorrectGuesses)).to.equal(-1)
			}
		}
	}
}
