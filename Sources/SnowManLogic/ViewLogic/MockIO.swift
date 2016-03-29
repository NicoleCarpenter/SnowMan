public class MockIO: Interactable {
	public var stubbedUserInput: [String]!
	private var displayCalled: Bool
	var counter: Int

	public init() {
		displayCalled = false
		counter = 0
	}

	public func getUserInput() -> String {
		let value = stubbedUserInput[counter]
		counter += 1
		return value
	}

	public func display(linesToPrint: String) {
		displayCalled = true
	}
}