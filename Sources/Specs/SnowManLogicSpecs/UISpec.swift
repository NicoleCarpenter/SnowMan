import SnowManLogic
import Swiftest

class UISpec: Swiftest.Spec {
  	let spec = describe("UI logic") {
  		var ui: MockUI!
  		before() {
  			ui = MockUI()
  		}
  		
  		describe("#getUserInput") {
            it("should return the user input") {
                ui.getUserInputReturn = "hello"
  				expect(ui.getUserInput()).to.equal("hello")
  			}
  		}
  	}
}