public class MockIO: Receivable {
	public var stubbedUserInput: [String]!
	var counter: Int

	public init() {
		counter = 0
	}

	public func getUserInput(getInput: () -> String) -> String {
		return String(getInput())
	}

	public func myReadLine() -> String {
		let value = stubbedUserInput[counter]
		counter += 1
		return value
	}

	public func display(linesToPrint: String) {
		print(linesToPrint)
	}
}