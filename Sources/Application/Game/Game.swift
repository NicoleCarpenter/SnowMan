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

	public func isGameOver(guess: Guess) {
		gameOver = guessManager.hasNoGuessesRemaining(maxNumberOfGuesses) || isWinner(guess)
	}

	public func isWinner(guess: Guess) -> Bool {
		let letters = separateLetters()
		winner = hasAllLettersGuessed(letters) || guess.isCorrectlyGuessedFullWord(word)
		return winner
	}

	private func playerTurn() {		
		view.assignBlanks(word, correctGuesses: guessManager.correctGuesses)
		let guess = view.receiveGuess()
		guessManager.appendGuess(word, guess: guess)
		let incorrectGuesses = guessManager.incorrectGuesses
		view.displayRemainingGuesses(guessManager.calculateRemainingGuesses(maxNumberOfGuesses))
		view.displayIncorrectGuesses(incorrectGuesses)
		isGameOver(guess)
	}

	private func separateLetters() -> [String] {
		return word.characters.map { String($0) }
	}

	private func hasAllLettersGuessed(letters: [String]) -> Bool {
		return guessManager.determineUnguessedLetters(letters).isEmpty
	}

	private func displayResults() {
		if (winner) {
			view.displayWinningMessage(word)
		} else {
			view.displayLosingMessage(word)
		}
	}
}
