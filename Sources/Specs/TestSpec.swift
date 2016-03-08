import Application
import Swiftest

class TestSpec: Swiftest.Spec {
  let spec = describe("Boolean tests") {
    it("passes when true is true") {
	    expect(true).to.equal(true)
    }

    it("fails when true is false") {
	    expect(true).to.equal(false)
    }
  }
}
