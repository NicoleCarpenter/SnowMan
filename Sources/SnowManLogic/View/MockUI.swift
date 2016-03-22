public class MockUI: Viewable {
	var getUserInputReturn = ""
	public init() {}

	public func getUserInput() -> String {
		getUserInputReturn = "hello"
		return getUserInputReturn
	}
}