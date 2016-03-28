public class MockIO: Interactable {
	public var stubbedUserInput: [String]!
	var counter: Int

	public init() {
		counter = 0
	}

	public func getUserInput() -> String {
		return stubbedUserInput[0]
	}

	public func display(linesToPrint: String) {
		print(linesToPrint)
	}
}