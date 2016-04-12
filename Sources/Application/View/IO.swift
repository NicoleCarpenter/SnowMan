import OS

public class IO: Interactable {
	public init() {
	}

	public func getUserInput() -> String {
		return readLine(stripNewline: true)!
	}

	public func display(linesToPrint: String) {
		print(linesToPrint)
	}

	public func clear() {
		system("clear")
	}
}
