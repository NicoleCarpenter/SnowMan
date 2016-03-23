import SnowManLogic
import Swiftest

class ViewSpec: Swiftest.Spec {
  	let spec = describe("view logic") {
  		var ui: Receivable!
  		var view: View!
  		before() {
  			ui = MockUI()
  			view = View(ui: ui)
  		}
  		
  		describe("#receiveGuess") {
  			it("should return the guess if it is a letter or word") {
  				expect(view.receiveGuess()).to.equal("hello")
  			}
		}

        describe("#determineBlanksNeeded") {
            var gameWord: String!
            before() {
                gameWord = "alligator"
            }
            it("should return the number of blanks needed for the given word") {
                expect(view.determineBlanksNeeded(gameWord)).to.equal(9)
            }
        }
  	}
}