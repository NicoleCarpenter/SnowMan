public class Game {
	var word: String
	let guessManager: GuessManager
	var view: View
	public var gameOver: Bool
	public var winner: Bool

	public init(word: String, guessManager: GuessManager, view: View) {
		self.word = word
		self.guessManager = guessManager
		self.view = view
		gameOver = false
		winner = false
	}

	public func playGame() {
		while (!gameOver) {
			playerTurn()
		}
		displayResults()
	}

	public func isGameOver(guess: String) {
		if (guessManager.hasNoGuessesRemaining() || isWinner(guess)) {
			self.gameOver = true
		}
	}

	public func isWinner(guess: String) -> Bool {
		let letters = separateLetters()
		if (guessManager.determineUnguessedLetters(letters).isEmpty || guessManager.correctlyGuessedFullWord(word, guess: guess)) {
			self.winner = true
			return true
		} else {
			return false			
		}

	}

	private func playerTurn() {		
		view.assignBlanks(word, correctGuesses: guessManager.correctGuesses)
		let guess = view.receiveGuess()
		
		if (guessManager.isGuessingFullWord(guess)) {
			guessManager.appendWordPlaceholder(word, guess: guess)
		} else {
			guessManager.appendGuess(word, guess: guess)
		}

		view.displayRemainingGuesses(guessManager.calculateRemainingGuesses())
		isGameOver(guess)
	}

	private func separateLetters() -> [String] {
		return word.characters.map { String($0) }
	}

	private func displayResults() {
		if (winner) {
			view.displayWinningMessage(word)
		} else {
			view.displayLosingMessage(word)
		}
	}
}