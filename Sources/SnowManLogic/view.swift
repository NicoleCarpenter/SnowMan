public class View: Viewable {
	public init() {
	}

	public func getUserInput() -> String {
		return String(readLine(stripNewline: true) ?? "")
	}
}


public protocol Viewable {
    func getUserInput() -> String
}