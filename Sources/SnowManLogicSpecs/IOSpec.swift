import SnowManLogic
import Swiftest

class IOSpec: Swiftest.Spec {
  	let spec = describe("IO logic") {
  		var io: Interactable!
  		before() {
  			io = IO()
  		}
  		
	        it("should return the user input") {
        		expect(io.getUserInput()).to.equal("hello")
        	}
		
        }
}