public class MockIO: Interactable {
	public var stubbedUserInput: [String]!
	var counter: Int

	public init() {
		counter = 0
	}

	public func getUserInput() -> String {
		return stubbedUserInput[0]
	}

	public func consoleReadLine() -> String {
		let value = stubbedUserInput[counter]
		counter += 1
		return value
	}

	public func display(linesToPrint: String) {
		print(linesToPrint)
	}
}