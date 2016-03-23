import SnowManLogic
import Swiftest

class UISpec: Swiftest.Spec {
  	let spec = describe("UI logic") {
  		var mockUI: MockUI!
  		before() {
  			mockUI = MockUI()
  		}
  		
  		describe("#getUserInput") {
            it("should return the user input") {
                mockUI.getUserInputReturn = "hello"
  				expect(mockUI.getUserInput()).to.equal("hello")
  			}
  		}
  	}
}