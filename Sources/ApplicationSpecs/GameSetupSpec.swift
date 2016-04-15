import Application
import Swiftest

class GameSetupSpec: Swiftest.Spec {
	let spec = describe("game setup logic") {
		var view: MockView!
		var gameSetup: GameSetup!
		before() {
			view = MockView()
			gameSetup = GameSetup(view: view)
		}

		describe("#getMaxNumberOfGuesses") {
			before() {
				view.stubReceiveMaxNumberOfGuesses("5")
				gameSetup.getMaxNumberOfGuesses()
			}

			it("should clear the screen") {
				expect(view.clearScreenCalled).to.equal(true)
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
