import WordList
import Application
import SetUp
import Swiftest

class GameSetupSpec: Swiftest.Spec {
	let spec = describe("game setup logic") {
		var words: [String]!
		var view: MockView!
		var wordListManager: WordListManager!
		var wordBuilder: WordBuilder!
		var gameSetup: GameSetup!
		before() {
			words = ["one", "two", "three"]
			view = MockView()
			wordListManager = WordListManager(words: words)
			wordBuilder = WordBuilder()
			gameSetup = GameSetup(view: view, wordListManager: wordListManager, wordBuilder: wordBuilder)
		}

		describe("#getMaxNumberOfGuesses") {
			before() {
				view.stubReceiveMaxNumberOfGuesses("5")
				gameSetup.getMaxNumberOfGuesses()
			}

			it("should display a prompt to the user") {
				expect(view.promptMaxNumberOfGuessesCalled).to.equal(true)
			}

			it("should recieve a number from the user") {
				expect(view.receiveMaxNumberOfGuessesCalled).to.equal(true)
				expect(view.receiveMaxNumberOfGuessesReturn).to.equal(5)
			}
		}

		describe("#assignGameWord") {
			before() {
				view.stubReceiveSelectionType("1")
				gameSetup.assignGameWord()
			}

			it("should display a prompt to the user") {
				expect(view.promptWordSelectionTypeCalled).to.equal(true)
			}

			it("should recieve a number from the user") {
				expect(view.receiveSelectionTypeCalled).to.equal(true)
				expect(view.receiveSelectionTypeReturn).to.equal(1)
			}

			it("should select a random word from dictionary if option 1 is selected") {
				expect(view.receiveWordCalled).to.equal(false)
				let word = gameSetup.assignGameWord()
				expect(words).to.contain(word.gameWord)
			}

			it("should allow the user to select a word if 2 is selected") {
				expect(view.receiveWordCalled).to.equal(true)
				view.stubReceiveSelectionType("2")
				view.stubReceiveWord("hello")
				let word = gameSetup.assignGameWord()
				expect(words).notTo.contain(word.gameWord)
				expect(word.gameWord).to.equal("hello")
			}
		}
	}
}
