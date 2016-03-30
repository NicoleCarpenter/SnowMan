public class Game {
	var word: String
	let guessManager: GuessManager
	var view: Viewable
	public var gameOver: Bool
	public var winner: Bool

	public init(word: String, guessManager: GuessManager, view: Viewable) {
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
		gameOver = guessManager.hasNoGuessesRemaining() || isWinner(guess)
	}

	public func isWinner(guess: String) -> Bool {
		let letters = separateLetters()
		winner = guessManager.determineUnguessedLetters(letters).isEmpty || guessManager.correctlyGuessedFullWord(word, guess: guess)
		return winner

	}

	private func playerTurn() {		
		view.assignBlanks(word, correctGuesses: guessManager.correctGuesses)
		let guess = view.receiveGuess()
		
		guessManager.appendGuess(word, guess: guess)
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
