public class MockUI: Receivable {
	public var stubbedUserInput: String!

	public init() {}

	public func getUserInput() -> String {
		return stubbedUserInput
	}

	public func display(linesToPrint: String) {
		print(linesToPrint)
	}
}