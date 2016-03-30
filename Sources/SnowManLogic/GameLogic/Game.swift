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

	public func isGameOver(guess: Guess) {
		gameOver = guessManager.hasNoGuessesRemaining() || isWinner(guess)
	}

	public func isWinner(guess: Guess) -> Bool {
		let letters = separateLetters()
		winner = allLettersGuessed(letters) || guess.isCorrectlyGuessedFullWord(word)
		return winner

	}

	private func playerTurn() {		
		view.assignBlanks(word, correctGuesses: guessManager.correctGuesses)
		let guess = view.receiveGuess()
		
		guessManager.appendGuess(word, guess: guess)

		let incorrectGuesses = guessManager.incorrectGuesses
		view.displayRemainingGuesses(guessManager.calculateRemainingGuesses())
		view.displayIncorrectGuesses(incorrectGuesses)
		isGameOver(guess)
	}

	private func separateLetters() -> [String] {
		return word.characters.map { String($0) }
	}

	private func allLettersGuessed(letters: [String]) -> Bool {
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
