public class UI: Receivable {
	public init() {
	}

	public func getUserInput() -> String {
		return String(readLine(stripNewline: true) ?? "")
	}

	public func display(linesToPrint: String) {
		print(linesToPrint)
	}
}
