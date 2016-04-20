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
		var playerBuilder: PlayerBuilder!
		var gameSetup: GameSetup!
		before() {
			words = ["one", "two", "three"]
			view = MockView()
			wordListManager = WordListManager(words: words)
			wordBuilder = WordBuilder()
			playerBuilder = PlayerBuilder()
			gameSetup = GameSetup(view: view, wordListManager: wordListManager, wordBuilder: wordBuilder, playerBuilder: playerBuilder)
		}

		describe("#assignPlayers") {
			it("should display a prompt to the user") {
				view.stubReceiveSelectionType("1")
				view.stubReceivePlayerName("Player 1")
				gameSetup.assignPlayers()
				expect(view.promptNumberOfPlayersCalled).to.equal(true)
			}

			it("should recieve a number from the user") {
				view.stubReceiveSelectionType("1")
				view.stubReceivePlayerName("Player 1")
				gameSetup.assignPlayers()
				expect(view.receiveSelectionTypeCalled).to.equal(true)
				expect(view.receiveSelectionTypeReturn).to.equal(1)
			}

			it("should create a new player") {
				view.stubReceiveSelectionType("1")
				view.stubReceivePlayerName("Player 1")
				expect(gameSetup.assignPlayers().first).to.equal(Player(name: "Player 1", order: 1, correctGuesses: [], incorrectGuesses: []))
				expect(gameSetup.assignPlayers().count).to.equal(1)
			}

			it("should create a second player if user selects 2") {
				view.stubReceiveSelectionType("2")
				view.stubReceivePlayerName("Player 1")
				expect(gameSetup.assignPlayers().first).to.equal(Player(name: "Player 1", order: 1, correctGuesses: [], incorrectGuesses: []))
				expect(gameSetup.assignPlayers().last).to.equal(Player(name: "Player 1", order: 2, correctGuesses: [], incorrectGuesses: []))
				expect(gameSetup.assignPlayers().count).to.equal(2)
			}
		}

		describe("#assignGameWord") {
			it("should display a prompt to the user") {
				view.stubReceiveSelectionType("1")
				gameSetup.assignGameWord()
				expect(view.promptWordSelectionTypeCalled).to.equal(true)
			}

			it("should recieve a number from the user") {
				view.stubReceiveSelectionType("1")
				gameSetup.assignGameWord()
				expect(view.receiveSelectionTypeCalled).to.equal(true)
				expect(view.receiveSelectionTypeReturn).to.equal(1)
			}

			it("should select a random word from dictionary if option 1 is selected") {
				view.stubReceiveSelectionType("1")
				gameSetup.assignGameWord()
				expect(view.promptReceiveWordCalled).to.equal(false)
				expect(view.receiveWordCalled).to.equal(false)
				let word = gameSetup.assignGameWord()
				expect(words).to.contain(word.gameWord)
			}

			it("should allow the user to select a word if 2 is selected") {
				view.stubReceiveSelectionType("2")
				view.stubReceiveWord("hello")
				let word = gameSetup.assignGameWord()
				expect(view.promptReceiveWordCalled).to.equal(true)
				expect(view.receiveWordCalled).to.equal(true)
				expect(words).notTo.contain(word.gameWord)
				expect(word.gameWord).to.equal("hello")
			}
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
	}
}
