import SnowManLogic
import Swiftest

class IOSpec: Swiftest.Spec {
  	let spec = describe("IO logic") {
  		var mockIO: MockIO!
  		before() {
  			mockIO = MockIO()
  		}
  		
  		describe("#getUserInput") {
			it("should return the user input") {
                	mockIO.stubbedUserInput = "hello"
  				expect(mockIO.getUserInput()).to.equal("hello")
  			}
  		}
  	}
}
