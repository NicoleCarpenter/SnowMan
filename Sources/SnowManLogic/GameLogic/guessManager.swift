public class GuessManager {
	public var totalIncorrectGuessesAllowed: Int
	public var correctGuesses: [String]
	public var incorrectGuesses: [String]

	public init (totalIncorrectGuessesAllowed: Int) {
		self.totalIncorrectGuessesAllowed = totalIncorrectGuessesAllowed
		correctGuesses = []
		incorrectGuesses = []
	}

	public func determineUnguessedLetters(letters: [String]) -> Set<String> {
		let setLetters = Set(letters)
		let setCorrectGuesses = Set(correctGuesses)
		return setLetters.subtract(setCorrectGuesses)
	}

	public func hasNoGuessesRemaining() -> Bool {
		let remainingGuesses = calculateRemainingGuesses()
		return remainingGuesses <= 0
	}

	private func calculateRemainingGuesses() -> Int {
		return totalIncorrectGuessesAllowed - incorrectGuesses.count
	}
}