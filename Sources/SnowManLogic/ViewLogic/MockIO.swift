public class MockIO: Receivable {
	public var stubbedUserInput: String!

	public init() {}

	public func getUserInput(getInput: () -> String) -> String {
		return String(getInput())
	}

	public func myReadLine() -> String {
		return stubbedUserInput
	}

	public func display(linesToPrint: String) {
		print(linesToPrint)
	}
}