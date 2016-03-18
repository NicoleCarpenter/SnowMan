public class View {
	public init() {
	}

	public func getUserInput() -> String {
		return String(readLine(stripNewline: true) ?? "")
	}
}
