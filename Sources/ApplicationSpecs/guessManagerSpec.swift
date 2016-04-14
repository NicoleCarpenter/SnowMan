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
			before() {
				word = "apple"
			}

			it("should return a set of letters in the word that have not been guessed") {
				guessManager.correctGuesses = ["a", "p"]
				expect(guessManager.determineUnguessedLetters(word)).to.equal(["l", "e"])
			}

			it("should return an empty set if all letters have been guessed") {
				guessManager.correctGuesses = ["a", "p", "l", "e"]
				expect(guessManager.determineUnguessedLetters(word)).to.equal([])
			}

			it("should return the full set of letters if no correct guesses have been made") {
				guessManager.correctGuesses = []
				expect(guessManager.determineUnguessedLetters(word)).to.equal(["a", "p", "l", "e"])
			}

			it("should return the word without spaces") {
				word = "two words"
				guessManager.correctGuesses = []
				expect(guessManager.determineUnguessedLetters(word)).to.equal(["t", "w", "o", "w", "o", "r", "d", "s"])
			}
		}

		describe("#hasNoGuessesRemaining") {
			var maxNumberOfGuesses: Int!
			before() {
				maxNumberOfGuesses = 5
			}

			it("should return true if no guesses remain") {
				guessManager.incorrectGuesses = ["c", "b", "d", "f", "g"]
				expect(guessManager.hasNoGuessesRemaining(maxNumberOfGuesses)).to.equal(true)
			}

			it("should return false if there are still remaining guesses") {
				guessManager.incorrectGuesses = ["c"]
				expect(guessManager.hasNoGuessesRemaining(maxNumberOfGuesses)).to.equal(false)
			}
		}

		describe("#calculateRemainingGuesses") {
			var maxNumberOfGuesses: Int!
			before() {
				maxNumberOfGuesses = 5
			}

			it("should return the number of guesses allowed if no incorrect guesses have been made") {
				guessManager.incorrectGuesses = []
				expect(guessManager.calculateRemainingGuesses(maxNumberOfGuesses)).to.equal(5)
			}

			it("should return the difference between guesses allowed and incorrect guesses") {
				guessManager.incorrectGuesses = ["c", "b"]
				expect(guessManager.calculateRemainingGuesses(maxNumberOfGuesses)).to.equal(3)
			}

			it("should return the difference between guesses allowed and incorrect guesses") {
				guessManager.incorrectGuesses = ["c", "b", "d", "f", "g", "h"]
				expect(guessManager.calculateRemainingGuesses(maxNumberOfGuesses)).to.equal(-1)
			}
		}

		describe("#appendGuess") {
			var word: String!
			before() {
				word = "apple"
			}

			it("should add word to correctGuesses if it is a correctly guessed word") {
				let guess = Guess(currentGuess: "apple")
				guessManager.appendGuess(word, guess: guess)
				expect(guessManager.correctGuesses).to.contain(guess.currentGuess)
				expect(guessManager.incorrectGuesses).notTo.contain(guess.currentGuess)
			}

			it("should add word to correctGuesses if it is a correctly guessed word, regardless of case") {
				let guess = Guess(currentGuess: "APPLE")
				guessManager.appendGuess(word, guess: guess)
				expect(guessManager.correctGuesses).to.contain(guess.currentGuess)
				expect(guessManager.incorrectGuesses).notTo.contain(guess.currentGuess)
			}

			it("should add word to incorrectGuesses if it is an incorrectly guessed word") {
				let guess = Guess(currentGuess: "banana")
				guessManager.appendGuess(word, guess: guess)
				expect(guessManager.incorrectGuesses).to.contain(guess.currentGuess)
				expect(guessManager.correctGuesses).notTo.contain(guess.currentGuess)
			}

			it("should add guess to correctGuesses collection if it is in the word") {
				let guess = Guess(currentGuess: "a")
				guessManager.appendGuess(word, guess: guess)
				expect(guessManager.correctGuesses).to.contain(guess.currentGuess)
				expect(guessManager.incorrectGuesses).notTo.contain(guess.currentGuess)
			}

			it("should add guess to correctGuesses collection if it is in the word") {
				let guess = Guess(currentGuess: "A")
				guessManager.appendGuess(word, guess: guess)
				expect(guessManager.correctGuesses).to.contain(guess.currentGuess)
				expect(guessManager.incorrectGuesses).notTo.contain(guess.currentGuess)
			}

			it("should not add guess to correctGuesses collection if it is not in the word") {
				let guess = Guess(currentGuess: "b")
				guessManager.appendGuess(word, guess: guess)
				expect(guessManager.correctGuesses).notTo.contain(guess.currentGuess)
			}
		}
	}
}
