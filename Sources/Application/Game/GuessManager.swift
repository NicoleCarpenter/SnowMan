public class GuessManager {
	public var correctGuesses: [String]
	public var incorrectGuesses: [String]

	public init () {
		correctGuesses = []
		incorrectGuesses = []
	}

	public func determineUnguessedLetters(letters: [String]) -> Set<String> {
		let setLetters = Set(letters)
		let setCorrectGuesses = Set(correctGuesses)
		return setLetters.subtract(setCorrectGuesses)
	}

	public func hasNoGuessesRemaining(maxNumberOfGuesses: Int) -> Bool {
		return calculateRemainingGuesses(maxNumberOfGuesses) <= 0
	}

	public func calculateRemainingGuesses(maxNumberOfGuesses: Int) -> Int {
		return maxNumberOfGuesses - incorrectGuesses.count
	}

	public func appendGuess(word: String, guess: Guess) {
		if guess.isCorrect(word) {
			correctGuesses.append(guess.currentGuess)
		} else {
			incorrectGuesses.append(guess.currentGuess)
		}
	}
}
