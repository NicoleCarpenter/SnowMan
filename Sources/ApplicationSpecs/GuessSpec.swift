import Application
import Swiftest

class GuessSpec: Swiftest.Spec {
	let spec = describe("guess logic") {
		describe("#isValid") {
			it("should return true if valid") {
				var guess = Guess(currentGuess: "a")
				expect(guess.isValid()).to.equal(true)

				guess = Guess(currentGuess: "apple")
				expect(guess.isValid()).to.equal(true)
			}

			it("should return false if invalid because guess is empty string") {
				let guess = Guess(currentGuess: "")
				expect(guess.isValid()).to.equal(false)
			}

			it("should return false if invalid because guess contains non-letter characters") {
				var guess = Guess(currentGuess: "1")
				expect(guess.isValid()).to.equal(false)

				guess = Guess(currentGuess: "!")
				expect(guess.isValid()).to.equal(false)
			}
		}

		describe("#isCorrect") {
			var word: String!
			before() {
				word = "apple"
			}

			it("should return true if a full word guess matches the game word") {
				let guess = Guess(currentGuess: "apple")
				expect(guess.isCorrect(word)).to.equal(true)
			}

			it("should return false if a full word guess does not match the game word") {
				let guess = Guess(currentGuess: "banana")
				expect(guess.isCorrect(word)).to.equal(false)
			}

			it("should return true if a letter guess is in the game word") {
				let guess = Guess(currentGuess: "a")
				expect(guess.isCorrect(word)).to.equal(true)
			}

			it("should return false if a letter guess is not in the game word") {
				let guess = Guess(currentGuess: "b")
				expect(guess.isCorrect(word)).to.equal(false)
			}
		}

		describe("#isFullWord") {
			it("should return true if guess is more than 1 character") {
				let guess = Guess(currentGuess: "hello")
				expect(guess.isFullWord()).to.equal(true)
			}

			it("should return false if guess is only 1 character") {
				let guess = Guess(currentGuess: "h")
				expect(guess.isFullWord()).to.equal(false)
			}

			it("should return false if guess is 0 characters") {
				let guess = Guess(currentGuess: "")
				expect(guess.isFullWord()).to.equal(false)
			}
		}

		describe("#isCorrectlyGuessedFullWord") {
			var word: String!
			before() {
				word = "apple"
			}

			it("should return true if full word is guessed") {
				let guess = Guess(currentGuess: "apple")
				expect(guess.isCorrectlyGuessedFullWord(word)).to.equal(true)
			}

			it("should return false if only part of the word is guessed") {
				let guess = Guess(currentGuess: "app")
				expect(guess.isCorrectlyGuessedFullWord(word)).to.equal(false)
			}

			it("should return false if the guess is incorrect") {
				let guess = Guess(currentGuess: "banana")
				expect(guess.isCorrectlyGuessedFullWord(word)).to.equal(false)
			}
		}
	}
}
