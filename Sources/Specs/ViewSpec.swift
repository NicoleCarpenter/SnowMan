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
  		
  		describe("#reveiveGuess") {
  			it("should return the guess if it is a letter or word") {
  				expect(view.receiveGuess()).to.equal("hello")
  			}
		}
  	}
}