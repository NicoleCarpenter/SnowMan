public class GuessManager {
	public var numberOfGuesses: Int
	public var correctGuesses: [String]
	public var incorrectGuesses: [String]

	public init (numberOfGuesses: Int) {
		self.numberOfGuesses = numberOfGuesses
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

	public func calculateRemainingGuesses() -> Int {
		return numberOfGuesses - incorrectGuesses.count
	}

	public func isGuessingFullWord(guess: String) -> Bool {
		return guess.characters.count > 1
	}

	public func correctlyGuessedFullWord(word: String, guess: String) -> Bool {
		return guess == word
	}

	public func appendWordPlaceholder(word: String, guess: String) {
		let fullWordGuessPlaceholder = "#"
		if (correctlyGuessedFullWord(word, guess: guess)) {
			correctGuesses.append(fullWordGuessPlaceholder)
		} else {
			incorrectGuesses.append(fullWordGuessPlaceholder)
		}
	}

	public func appendGuess(word: String, guess: String) {
		if (hasGuessInWord(word, guess: guess)) {
			correctGuesses.append(guess)
		} else {
			incorrectGuesses.append(guess)
		}
	}

	private func hasGuessInWord(word: String, guess: String) -> Bool {
		return word.lowercaseString.characters.contains(Character(guess))
	}
}