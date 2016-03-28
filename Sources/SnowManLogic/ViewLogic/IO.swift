public class IO: Interactable {

	public init() {
	}

	public func getUserInput() -> String {
		return consoleReadLine()
	}

	public func consoleReadLine() -> String {
		return readLine(stripNewline: true) ?? ""
	}

	public func display(linesToPrint: String) {
		print(linesToPrint)
	}

}