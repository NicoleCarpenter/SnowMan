import Application
import Swiftest

class ViewSpec: Swiftest.Spec {
	let spec = describe("View logic") {
		var io: MockIO!
		var validator: CharacterValidator!
		var view: View!
		before() {
			io = MockIO()
			validator = CharacterValidator()
			view = View(io: io, validator: validator)
 		}

		describe("#promptMaxNumberOfGuesses") {
			it("should print a prompt requesting number of guesses") {
				let outputToPrint = "How many guesses do you want to have for this game?"
				view.promptMaxNumberOfGuesses()
				expect(io.displayCalled).to.equal(true)
				expect(io.getPrintedOutputStream).to.equal(outputToPrint)
			}
		}

		describe("#receiveMaxNumberOfGuesses") {
			var errorValue: String!
			before() {
				errorValue = "9999"
			}

			it("should return the user input if it is a valid number greater than 0") {
				io.stubbedUserInput = ["5"]
				expect(io.displayCalled).to.equal(false)
				expect(view.receiveMaxNumberOfGuesses()).to.equal(5)
			}

			it("should return an error value if the user input is a letter") {
				io.stubbedUserInput = ["a", errorValue]
				expect(view.receiveMaxNumberOfGuesses()).to.equal(Int(errorValue)!)
				expect(io.displayCalled).to.equal(true)
			}

			it("should return an error value if the user input is a word") {
				io.stubbedUserInput = ["apple", errorValue]
				expect(view.receiveMaxNumberOfGuesses()).to.equal(Int(errorValue)!)
				expect(io.displayCalled).to.equal(true)
			}

			it("should return an error value if the user input is a non-numeric character") {
				io.stubbedUserInput = ["a", errorValue]
				expect(view.receiveMaxNumberOfGuesses()).to.equal(Int(errorValue)!)
				expect(io.displayCalled).to.equal(true)
			}

			it("should return an error value if the user input is a combination of numbers and non-numbers") {
				io.stubbedUserInput = ["5a", "a5", "5?", "?5", errorValue]
				expect(view.receiveMaxNumberOfGuesses()).to.equal(Int(errorValue)!)
				expect(io.displayCalled).to.equal(true)
			}

			it("should return an error value if the user input is not a whole number") {
				io.stubbedUserInput = ["1.5", errorValue]
				expect(view.receiveMaxNumberOfGuesses()).to.equal(Int(errorValue)!)
				expect(io.displayCalled).to.equal(true)
			}

			it("should return an error value if the user input is zero") {
				io.stubbedUserInput = ["0", errorValue]
				expect(view.receiveMaxNumberOfGuesses()).to.equal(Int(errorValue)!)
				expect(io.displayCalled).to.equal(true)
			}

			it("should return an error value if the user input is a negative number") {
				io.stubbedUserInput = ["-1", errorValue]
				expect(view.receiveMaxNumberOfGuesses()).to.equal(Int(errorValue)!)
				expect(io.displayCalled).to.equal(true)
			}
		}

		describe("#promptWordSelectionType") {
			it("should print a prompt requesting type of word selection") {
				let options = ["[1] Random", "[2] Select"]
				let outputToPrint = "[2] Select"
				view.promptWordSelectionType(options)

				expect(io.displayCalled).to.equal(true)
				expect(io.getPrintedOutputStream).to.equal(outputToPrint)
			}
		}

		describe("#receiveSelectionType") {
			var numberOfOptions: Int!
			var errorValue: String!
			before() {
				numberOfOptions = 3
				errorValue = "3"
			}

			it("should return the user input if it is a valid number between 0 and the number of options") {
				io.stubbedUserInput = ["1"]
				expect(view.receiveSelectionType(numberOfOptions)).to.equal(1)
				expect(io.displayCalled).to.equal(false)
			}

			it("should return the user input if it equals the number of options") {
				io.stubbedUserInput = ["3"]
				expect(view.receiveSelectionType(numberOfOptions)).to.equal(3)
				expect(io.displayCalled).to.equal(false)
			}

			it("should return an error value if the user input is a letter") {
				io.stubbedUserInput = ["a", errorValue]
				expect(view.receiveSelectionType(numberOfOptions)).to.equal(Int(errorValue)!)
				expect(io.displayCalled).to.equal(true)
			}

			it("should return an error value if the user input is a combination of numbers and non-numbers") {
				io.stubbedUserInput = ["5a", "a5", "5?", "?5", errorValue]
				expect(view.receiveSelectionType(numberOfOptions)).to.equal(Int(errorValue)!)
				expect(io.displayCalled).to.equal(true)
			}

			it("should return an error value if the user input is not a whole number") {
				io.stubbedUserInput = ["1.5", errorValue]
				expect(view.receiveSelectionType(numberOfOptions)).to.equal(Int(errorValue)!)
				expect(io.displayCalled).to.equal(true)
			}

			it("should return an error value if the user input is zero") {
				io.stubbedUserInput = ["0", errorValue]
				expect(view.receiveSelectionType(numberOfOptions)).to.equal(Int(errorValue)!)
				expect(io.displayCalled).to.equal(true)
			}

			it("should return an error value if the user input is a negative number") {
				io.stubbedUserInput = ["-1", errorValue]
				expect(view.receiveSelectionType(numberOfOptions)).to.equal(Int(errorValue)!)
				expect(io.displayCalled).to.equal(true)
			}
		}

		describe("#receiveWord") {
			it("should return the user input if it is a string of letters") {
				io.stubbedUserInput = ["hello"]
				let word = view.receiveWord()
				expect(io.displayCalled).to.equal(false)
				expect(word).to.equal("hello")
			}

			it("should return the user input if it is a string containing capitalized letters") {
				io.stubbedUserInput = ["Hello"]
				let word = view.receiveWord()
				expect(io.displayCalled).to.equal(false)
				expect(word).to.equal("Hello")
			}

			it("should return the user input if it is a valid phrase") {
				io.stubbedUserInput = ["hello world"]
				let word = view.receiveWord()
				expect(io.displayCalled).to.equal(false)
				expect(word).to.equal("hello world")
			}

			it("should return the user input if it is a single letter") {
				io.stubbedUserInput = ["a"]
				let word = view.receiveWord()
				expect(io.displayCalled).to.equal(false)
				expect(word).to.equal("a")
			}

			it("should return the user input if it is a capitalized single letter") {
				io.stubbedUserInput = ["A"]
				let word = view.receiveWord()
				expect(io.displayCalled).to.equal(false)
				expect(word).to.equal("A")
			}

			it("should return an error message if the user input is a number") {
				io.stubbedUserInput = ["1", "fail"]
				let word = view.receiveWord()
				expect(io.displayCalled).to.equal(true)
				expect(word).to.equal("fail")
			}

			it("should return an error message if the user input is a non-letter character") {
				io.stubbedUserInput = ["?", "fail"]
				let word = view.receiveWord()
				expect(io.displayCalled).to.equal(true)
				expect(word).to.equal("fail")
			}

			it("should return an error message if the user input is a combination of valid and invalid inputs") {
				io.stubbedUserInput = ["?a", "fail"]
				let word = view.receiveWord()
				expect(io.displayCalled).to.equal(true)
				expect(word).to.equal("fail")
			}

			it("should return an error message if the user hits return") {
				io.stubbedUserInput = ["", "fail"]
				let word = view.receiveWord()
				expect(io.displayCalled).to.equal(true)
				expect(word).to.equal("fail")
			}
		}

		describe("#receiveGuess") {
			it("should return the user input if it is a single letter") {
				io.stubbedUserInput = ["a"]
				let guess = view.receiveGuess()
				expect(io.displayCalled).to.equal(false)
				expect(guess).to.equal("a")
			}

			it("should return the user input if it is a string of letters") {
				io.stubbedUserInput = ["hello"]
				let guess = view.receiveGuess()
				expect(io.displayCalled).to.equal(false)
				expect(guess).to.equal("hello")
			}

			it("should return the user input if it is a valid phrase") {
				io.stubbedUserInput = ["hello world"]
				let guess = view.receiveGuess()
				expect(io.displayCalled).to.equal(false)
				expect(guess).to.equal("hello world")
			}

			it("should return an error message if the user input is a number") {
				io.stubbedUserInput = ["1", "fail"]
				let guess = view.receiveGuess()
				expect(io.displayCalled).to.equal(true)
				expect(guess).to.equal("fail")
			}

			it("should return an error message if the user input is a non-letter character") {
				io.stubbedUserInput = ["?", "fail"]
				let guess = view.receiveGuess()
				expect(io.displayCalled).to.equal(true)
				expect(guess).to.equal("fail")
			}

			it("should return an error message if the user input is a combination of valid and invalid inputs") {
				io.stubbedUserInput = ["?a", "fail"]
				let guess = view.receiveGuess()
				expect(io.displayCalled).to.equal(true)
				expect(guess).to.equal("fail")
			}

			it("should return an error message if the user hits return") {
				io.stubbedUserInput = ["", "fail"]
				let guess = view.receiveGuess()
				expect(io.displayCalled).to.equal(true)
				expect(guess).to.equal("fail")
			}

			it("should return an error message if the user hits space as the only character") {
				io.stubbedUserInput = [" ", "fail"]
				let guess = view.receiveGuess()
				expect(io.displayCalled).to.equal(true)
				expect(guess).to.equal("fail")
			}

			it("should return an error message if the user input is a phrase with invalid characters") {
				io.stubbedUserInput = ["hello world!", "h3llo world", "fail"]
				let guess = view.receiveGuess()
				expect(io.displayCalled).to.equal(true)
				expect(guess).to.equal("fail")
			}
		}

		describe("#displayBlanks") {
			var gameWord: String!
			before() {
				gameWord = "hello"
			}

			it("should return only blanks for unguessed word") {
				let correctGuesses: [String] = []
				let outputToPrint = "__  __  __  __  __ "
				view.displayBlanks(gameWord, correctGuesses: correctGuesses)
				expect(io.displayCalled).to.equal(true)
				expect(io.getPrintedOutputStream).to.equal(outputToPrint)
			}

			it("should return no blanks if the word has been guessed") {
				let correctGuesses = ["h", "e", "l", "o"]
				let outputToPrint = "h e l l o"
				view.displayBlanks(gameWord, correctGuesses: correctGuesses)
				expect(io.displayCalled).to.equal(true)
				expect(io.getPrintedOutputStream).to.equal(outputToPrint)
			}

			it("should return blanks and letters for partially guessed word") {
				let correctGuesses = ["h", "e"]
				let outputToPrint = "h e __  __  __ "
				view.displayBlanks(gameWord, correctGuesses: correctGuesses)
				expect(io.displayCalled).to.equal(true)
				expect(io.getPrintedOutputStream).to.equal(outputToPrint)
			}
		}

		describe("#displayImage") {
			var image: [String]!
			before() {
				image = [
					" .-.  .-.,",
					"|   \\/   |,",
					"\\        /,",
					"`\\    /`,",
					"  `\\/`"
				]
			}

			it("should print the top line of the image if only 1 guess remains and guesses equals image lines") {
				let remainingGuesses = 1
				let maxNumberOfGuesses = 5
				view.displayImage(image, remainingGuesses: remainingGuesses, maxNumberOfGuesses: maxNumberOfGuesses)
				expect(io.displayCalled).to.equal(true)
				expect(io.getPrintedOutputStream).to.equal(image.first!)
			}

			it("should print the second line of the image if only 1 guess remains and guesses equals image lines") {
				let remainingGuesses = 1
				let maxNumberOfGuesses = 4
				view.displayImage(image, remainingGuesses: remainingGuesses, maxNumberOfGuesses: maxNumberOfGuesses)
				expect(io.displayCalled).to.equal(true)
				expect(io.getPrintedOutputStream).to.equal(image[1])
			}

			it("should print the bottom line of the image if remaining guesses equals image lines") {
				let remainingGuesses = 5
				let maxNumberOfGuesses = 5
				view.displayImage(image, remainingGuesses: remainingGuesses, maxNumberOfGuesses: maxNumberOfGuesses)
				expect(io.displayCalled).to.equal(true)
				expect(io.getPrintedOutputStream).to.equal(image.last!)
			}
		}

		describe("#displayRemainingGuesses") {
			it("should return the number of guesses remaining") {
				let remainingGuesses = 4
				view.displayRemainingGuesses(remainingGuesses)
				let outputToPrint = "You have \(remainingGuesses) remaining guesses"

				expect(io.displayCalled).to.equal(true)
				expect(io.getPrintedOutputStream).to.equal(outputToPrint)
			}

			it("should return 0 guesses remaining if no guesses remain") {
				let remainingGuesses = 0
				view.displayRemainingGuesses(remainingGuesses)
				let outputToPrint = "You have \(remainingGuesses) remaining guesses"

				expect(io.displayCalled).to.equal(true)
				expect(io.getPrintedOutputStream).to.equal(outputToPrint)
			}
		}

		describe("#displayIncorrectGuesses") {
			it("should print out the incorrect guesses if there are any") {
				var incorrectGuesses = ["a", "b", "apple"]
				view.displayIncorrectGuesses(incorrectGuesses)

				expect(io.displayCalled).to.equal(true)
				expect(io.getPrintedOutputStream).to.equal("Incorrect guesses: \(incorrectGuesses.joinWithSeparator("  "))")
			}
		}

		describe("#displayWinningMessage") {
			it("should print a congragulatory message if winning conditions met") {
				let gameWord = "hello"
				let outputToPrint = ("Congratulations. You win! You correctly guessed \"\(gameWord)\"")
				view.displayWinningMessage(gameWord)

				expect(io.displayCalled).to.equal(true)
				expect(io.getPrintedOutputStream).to.equal(outputToPrint)
			}
		}

		describe("#displayLosingMessage") {
			it("should inform player of loss if winning conditions not met") {
				let gameWord = "hello"
				let outputToPrint = ("Game Over. You ran out of guesses. The word was \"\(gameWord)\"")
				view.displayLosingMessage(gameWord)

				expect(io.displayCalled).to.equal(true)
				expect(io.getPrintedOutputStream).to.equal(outputToPrint)
			}
		}

		describe("#clearScreen") {
			it("should clear the screen") {
				view.clearScreen()
				expect(io.clearCalled).to.equal(true)
			}
		}
	}
}
