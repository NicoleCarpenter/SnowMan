public class GuessManager {
	public var totalIncorrectGuessesAllowed: Int
	public var correctGuesses: [String] = []
	public var incorrectGuesses: [String] = []

	public init (totalIncorrectGuessesAllowed: Int) {
		self.totalIncorrectGuessesAllowed = totalIncorrectGuessesAllowed
	}

	public func findUnguessedLetters(letters: [String]) -> Set<String> {
		let setLetters = Set(letters)
		let setCorrectGuesses = Set(correctGuesses)
		return setLetters.subtract(setCorrectGuesses)
	}

	public func calculateRemainingGuesses() -> Int {
		return totalIncorrectGuessesAllowed - incorrectGuesses.count
	}

	public func noGuessesRemaining() -> Bool {
		let remainingGuesses = calculateRemainingGuesses()
		print(remainingGuesses)
		if (remainingGuesses <= 0) {
			return true
		} else {
			return false
		}
	}
}