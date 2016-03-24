public class IO: Receivable {
	public init() {
	}

	public func getUserInput() -> String {
		return String(readLine(stripNewline: true) ?? "")
	}

	public func display(linesToPrint: String) {
		print(linesToPrint)
	}

	// public func getUserInput(inputFunc: Function) -> String {
	// 	return (String(inputFunc) ?? "")
	// }
}

// func mockReadLine() -> String {
// 	return "hello"
// }

// func myReadLine() -> String {
// 	readLine(stripNewLine: true)
// }

// public func getUserInput(inputFunc: () -> String) {
// 	return String(inputFunc) ?? ""
// }
