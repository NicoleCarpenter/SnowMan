public protocol Receivable {
	func getUserInput(getInput: () -> String) -> String
	func myReadLine() -> String
	func display(linesToPrint: String)
}
