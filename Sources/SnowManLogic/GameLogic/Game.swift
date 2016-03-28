public class Game {
	var word: String
	let guessManager: GuessManager
	var view: View

	public init(word: String, guessManager: GuessManager, view: View) {
		self.word = word
		self.guessManager = guessManager
		self.view = view
	}

	public func playGame() {
		while (!isGameOver()) {
			playerTurn()
		}
		displayResults()
	}

	public func isGameOver() -> Bool {
		return guessManager.hasNoGuessesRemaining() || isWinner()
	}

	public func isWinner() -> Bool {
		let letters = separateLetters()
		return guessManager.determineUnguessedLetters(letters).isEmpty || guessManager.correctlyGuessedFullWord(word)
	}

	private func playerTurn() {		
		view.assignBlanks(word, correctGuesses: guessManager.correctGuesses)
		guessManager.guess = guessManager.assignGuess(view)
		
		if (guessManager.isGuessingFullWord()) {
			guessManager.appendWordPlaceholder(word)
		} else {
			guessManager.appendGuess(word)
		}
		view.displayRemainingGuesses(guessManager.calculateRemainingGuesses())
	}

	private func separateLetters() -> [String] {
		return word.characters.map { String($0) }
	}

	private func displayResults() {
		if (isWinner()) {
			view.displayWinningMessage(word)
		} else {
			view.displayLosingMessage(word)
		}
	}
}