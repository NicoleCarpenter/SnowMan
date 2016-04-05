public class Game {
	let word: String
	let guessManager: GuessManager
	let view: Viewable
	let maxNumberOfGuesses: Int
	public var gameOver: Bool
	public var winner: Bool

	public init(word: String, guessManager: GuessManager, view: Viewable, maxNumberOfGuesses: Int) {
		self.word = word
		self.guessManager = guessManager
		self.view = view
		self.maxNumberOfGuesses = maxNumberOfGuesses
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
		gameOver = guessManager.hasNoGuessesRemaining(maxNumberOfGuesses) || isWinner(guess)
	}

	public func isWinner(guess: String) -> Bool {
		let letters = separateLetters()
		winner = guessManager.determineUnguessedLetters(letters).isEmpty || guessManager.correctlyGuessedFullWord(word, guess: guess)
		return winner

	}

	private func playerTurn() {		
		view.assignBlanks(word, correctGuesses: guessManager.correctGuesses)
		let guess = view.receiveGuess()
		
		if (guessManager.isGuessingFullWord(guess)) {
			guessManager.appendWordPlaceholder(word, guess: guess)
		} else {
			guessManager.appendGuess(word, guess: guess)
		}

		view.displayRemainingGuesses(guessManager.calculateRemainingGuesses(maxNumberOfGuesses))
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