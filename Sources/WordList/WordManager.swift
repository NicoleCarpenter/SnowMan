import OS

public class DictionaryManager {
	public var words: [String]			

	public init(words: [String]) {
		self.words = words
	}

	public func getRandomWord() -> String {
		let index = getRandomIndex()
		return words[index]
	}

	private func getRandomIndex() -> Int {
		OS.srand(UInt32(time(nil)))
		let randNum = Int(OS.rand())
		return randNum % words.count
	}
}