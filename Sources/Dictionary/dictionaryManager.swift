import OS

public class DictionaryManager {
	let gameWords = words

	public init() {
	}

	public func getRandomNumber() -> Int {
		OS.srand(UInt32(time(nil)))
		let randNum = Int(OS.rand())
		return randNum % gameWords.count
	}

	public func getRandomWord() -> String {
		let index = self.getRandomNumber()
		return gameWords[index]
	}
}