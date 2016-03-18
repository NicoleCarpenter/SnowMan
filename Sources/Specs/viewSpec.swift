import SnowManLogic
import Swiftest

class ViewSpec: Swiftest.Spec {
  	let spec = describe("view logic") {
  		let view = View()
  		describe("#getUserInput") {
  			it("should return the user input") {
  				expect(view.getUserInput()).to.equal("true")
  			}
  		}
  	}
}