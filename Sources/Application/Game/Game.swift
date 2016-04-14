public class Game {
	let word: String
	let guessManager: GuessManager
	let view: Viewable
	let maxNumberOfGuesses: Int
	let guessBuilder: GuessBuilder
	public var gameOver: Bool
	public var winner: Bool

	public init(word: String, guessManager: GuessManager, view: Viewable, maxNumberOfGuesses: Int, guessBuilder: GuessBuilder) {
		self.word = word
		self.guessManager = guessManager
		self.view = view
		self.maxNumberOfGuesses = maxNumberOfGuesses
		self.guessBuilder = guessBuilder
		gameOver = false
		winner = false
	}

	public func playGame() {
		initialScreenView()
		while (!gameOver) {
			playerTurn()
		}
		displayResults()
	}

	public func isGameOver(guess: Guess) {
		gameOver = guessManager.hasNoGuessesRemaining(maxNumberOfGuesses) || isWinner(guess)
	}

	public func isWinner(guess: Guess) -> Bool {
		winner = hasAllLettersGuessed() || guess.isCorrectlyGuessedFullWord(word)
		return winner
	}

	private func initialScreenView() {
		view.clearScreen()
		view.displayImage(snowManImage, remainingGuesses: maxNumberOfGuesses, maxNumberOfGuesses: maxNumberOfGuesses)
	}

	private func playerTurn() {
		view.displayBlanks(word, correctGuesses: guessManager.correctGuesses)
		let guess = guessBuilder.buildGuess(view.receiveGuess())
		guessManager.appendGuess(word, guess: guess)
		let remainingGuesses = guessManager.calculateRemainingGuesses(maxNumberOfGuesses)
		let incorrectGuesses = guessManager.incorrectGuesses

		view.clearScreen()
		view.displayImage(snowManImage, remainingGuesses: remainingGuesses, maxNumberOfGuesses: maxNumberOfGuesses)
		view.displayRemainingGuesses(remainingGuesses)
		view.displayIncorrectGuesses(incorrectGuesses)
		isGameOver(guess)
	}

	private func hasAllLettersGuessed() -> Bool {
		return guessManager.determineUnguessedLetters(word).isEmpty
	}

	private func displayResults() {
		if (winner) {
			view.displayWinningMessage(word)
		} else {
			view.displayLosingMessage(word)
		}
	}
}
