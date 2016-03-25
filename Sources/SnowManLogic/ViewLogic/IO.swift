public class IO: Receivable {

	public init() {
	}

	public func getUserInput(getInput: () -> String) -> String {
		return String(getInput())
	}

	public func myReadLine() -> String {
		return readLine(stripNewline: true) ?? ""
	}

	public func display(linesToPrint: String) {
		print(linesToPrint)
	}

}