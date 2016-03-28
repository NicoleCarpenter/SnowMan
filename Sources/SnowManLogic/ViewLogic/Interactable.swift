public protocol Interactable {
	func getUserInput() -> String
	func consoleReadLine() -> String
	func display(linesToPrint: String)
}
