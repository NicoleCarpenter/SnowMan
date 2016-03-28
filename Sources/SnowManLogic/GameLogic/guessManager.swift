public class GuessManager {
	public var totalIncorrectGuessesAllowed: Int
	public var correctGuesses: [String]
	public var incorrectGuesses: [String]
	public var guess: String

	public init (totalIncorrectGuessesAllowed: Int) {
		self.totalIncorrectGuessesAllowed = totalIncorrectGuessesAllowed
		correctGuesses = []
		incorrectGuesses = []
		guess = ""
	}

	public func assignGuess(view: View) -> String {
		guess = view.receiveGuess()
		return guess
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
		return totalIncorrectGuessesAllowed - incorrectGuesses.count
	}

	public func isGuessingFullWord() -> Bool {
		return guess.characters.count > 1
	}

	public func correctlyGuessedFullWord(word: String) -> Bool {
		return guess == word
	}

	public func appendWordPlaceholder(word: String) {
		let fullWordGuessPlaceholder = "#"
		if (correctlyGuessedFullWord(word)) {
			correctGuesses.append(fullWordGuessPlaceholder)
		} else {
			incorrectGuesses.append(fullWordGuessPlaceholder)
		}
		calculateRemainingGuesses()
	}

	public func appendGuess(word: String) {
		if (hasGuessInWord(word)) {
			correctGuesses.append(guess)
		} else {
			incorrectGuesses.append(guess)
		}
		calculateRemainingGuesses()
	}

	private func hasGuessInWord(word: String) -> Bool {
		return word.lowercaseString.characters.contains(Character(guess))
	}
}