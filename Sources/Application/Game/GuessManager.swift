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