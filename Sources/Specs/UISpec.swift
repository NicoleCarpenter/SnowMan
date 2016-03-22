import SnowManLogic
import Swiftest

class UISpec: Swiftest.Spec {
  	let spec = describe("UI logic") {
  		var view: MockUI!
  		before() {
  			view = MockUI()
  		}
  		
  		describe("#getUserInput") {
  			it("should return the user input") {
  				expect(view.getUserInput()).to.equal("hello")
  			}
  		}
  	}
}