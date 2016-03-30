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

	public func calculateRemainingGuesses() -> Int {
		return totalIncorrectGuessesAllowed - incorrectGuesses.count
	}

	public func isGuessingFullWord(guess: String) -> Bool {
		return guess.characters.count > 1
	}

	public func correctlyGuessedFullWord(word: String, guess: String) -> Bool {
		return guess == word
	}

	public func appendGuess(word: String, guess: String) {
		if (isGuessingFullWord(guess)) {
			addGuessToCollection(correctlyGuessedFullWord, word, guess)
		} else {
			addGuessToCollection(hasGuessInWord, word, guess)
		}
	}

	private func addGuessToCollection(correctlyGuessed: (String, String) -> Bool,  _ word: String, _ guess: String) {
		if (correctlyGuessed(word, guess)) {
			correctGuesses.append(guess)
		} else {
			incorrectGuesses.append(guess)
		}		
	}

	private func hasGuessInWord(word: String, guess: String) -> Bool {
		return word.lowercaseString.characters.contains(Character(guess))
	}
}