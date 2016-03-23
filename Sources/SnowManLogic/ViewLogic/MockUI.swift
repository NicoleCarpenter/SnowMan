public class MockUI: Receivable {
	public var getUserInputReturn = ""

	public init() {}

	public func getUserInput() -> String {
		return getUserInputReturn
	}
}