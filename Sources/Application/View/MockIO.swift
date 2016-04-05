public class MockIO: Interactable {
	public var stubbedUserInput: [String]!
	public var displayCalled: Bool
	public var getPrintedOutputStream: String!
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

	public func display(outputToPrint: String) {
		self.getPrintedOutputStream = outputToPrint
		displayCalled = true
	}
}