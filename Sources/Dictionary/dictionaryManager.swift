import OS

public class DictionaryManager {
	public let gameWords = words

	public init() {
	}

	public func getRandomWord() -> String {
		let index = getRandomIndex()
		return gameWords[index]
	}

	private func getRandomIndex() -> Int {
		OS.srand(UInt32(time(nil)))
		let randNum = Int(OS.rand())
		return randNum % gameWords.count
	}
}