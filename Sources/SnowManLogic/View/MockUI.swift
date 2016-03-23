public class MockUI: Receivable {
	var getUserInputReturn = ""

	public init() {}

	public func getUserInput() -> String {
		getUserInputReturn = "hello"
		return getUserInputReturn
	}
}