import SnowManLogic
import Swiftest

class ViewSpec: Swiftest.Spec {
  	let spec = describe("view logic") {
  		var view: MockView!
  		before() {
  			view = MockView()
  		}
  		
  		describe("#getUserInput") {
  			it("should return the user input") {
  				expect(view.getUserInput()).to.equal("hello")
  			}
  		}
  	}
}