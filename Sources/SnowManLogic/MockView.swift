public class MockView: Viewable {
	var getUserInputReturn = ""
	public init() {}

	public func getUserInput() -> String {
		getUserInputReturn = "hello"
		return getUserInputReturn
	}
}