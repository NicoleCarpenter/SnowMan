public class Game {
	var word: String
	var guessManager: GuessManager
	var view: View
	var guess: String

	public init(word: String, guessManager: GuessManager, view: View) {
		self.word = word
		self.guessManager = guessManager
		self.view = view
		guess = ""
	}

	public func playGame() {
		while (gameIsOver() == false) {
			playerTurn()
		}
		view.displayResults(word, winner: isWinner())
	}

	public func gameIsOver() -> Bool {
		return guessManager.hasNoGuessesRemaining() || isWinner()
	}

	public func isWinner() -> Bool {
		let letters = separateLetters()
		return guessManager.determineUnguessedLetters(letters).isEmpty || guessManager.correctlyGuessedFullWord(word, guess: guess)
	}

	private func playerTurn() {
		view.assignBlanks(word, correctGuesses: guessManager.correctGuesses)
		guess = view.receiveGuess(view.getGuessFromUser)
		
		if (guessManager.isGuessingFullWord(guess)) {
			guessManager.appendGuess(word, guess: "#")
		} else {
			guessManager.appendGuess(word, guess: Character(guess))
		}
		view.displayRemainingGuesses(guessManager.calculateRemainingGuesses())
	}

	private func separateLetters() -> [String] {
		return word.characters.map { String($0) }
	}
}