import SnowManLogic
import Swiftest

class IOSpec: Swiftest.Spec {
  	let spec = describe("IO logic") {
  		var io: IO!
  		before() {
  			io = IO()
  		}
  		
      // it("should return the user input") {
      //   expect(io.getUserInput(mockReadLine("hello")).to.equal("hello"))
      // }
  	}
}
