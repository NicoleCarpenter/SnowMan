public class GuessManager {
	public var correctGuesses: [String] = []

	public init () {
	}

	public func findUnguessedLetters(letters: [String]) -> Set<String> {
		let setLetters = Set(letters)
		let setCorrectGuesses = Set(correctGuesses)
		return setLetters.subtract(setCorrectGuesses)
	}
}