public class GuessManager {

	public init () {}

	public func determineUnguessedLetters(word: String, correctGuesses: [String]) -> Set<String> {
		let letters = separateLetters(word)
		let setLetters = Set(letters)
		let setCorrectGuesses = Set(correctGuesses)
		return setLetters.subtract(setCorrectGuesses)
	}

	public func hasNoGuessesRemaining(maxNumberOfGuesses: Int, incorrectGuesses: [String]) -> Bool {
		return calculateRemainingGuesses(maxNumberOfGuesses, incorrectGuesses: incorrectGuesses) <= 0
	}

	public func calculateRemainingGuesses(maxNumberOfGuesses: Int, incorrectGuesses: [String]) -> Int {
		return maxNumberOfGuesses - incorrectGuesses.count
	}

	public func appendGuess(word: String, guess: Guess, player: Player) {
		if guess.isCorrect(word) {
			player.correctGuesses.append(guess.currentGuess.lowercaseString)
			player.correctGuesses.append(guess.currentGuess.uppercaseString)
		} else {
			player.incorrectGuesses.append(guess.currentGuess)
		}
	}

	private func separateLetters(word: String) -> [String] {
		let allChars = word.characters.map { String($0) }
		return allChars.filter({$0 != " "})
	}
}
