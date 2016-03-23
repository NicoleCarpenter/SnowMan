public class MockUI: Receivable {
	public var getUserInputReturn = ""

	public init() {}

	public func getUserInput() -> String {
		return getUserInputReturn
	}

	public func display(linesToPrint: String) {
		print(linesToPrint)
	}
}