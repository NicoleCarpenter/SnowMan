public class Game {
	let word: String
	let guessManager: GuessManager
	let view: Viewable
	let maxNumberOfGuesses: Int
	let guessBuilder: GuessBuilder
	let players: [Player]
	public var gameOver: Bool
	public var winner: Bool

	public init(word: String, guessManager: GuessManager, view: Viewable, maxNumberOfGuesses: Int, guessBuilder: GuessBuilder, players: [Player]) {
		self.word = word
		self.guessManager = guessManager
		self.view = view
		self.maxNumberOfGuesses = maxNumberOfGuesses
		self.guessBuilder = guessBuilder
		self.players = players
		gameOver = false
		winner = false
	}

	public func playGame() {
		initialScreenView()
		while (!gameOver) {
			for player in players {
				if winner { break }
				playerTurn(player)
			}
		}
		displayResults()
	}

	public func isGameOver(guess: Guess, correctGuesses: [String]) {
		gameOver = isAllPlayersOutOfGuesses() || isWinner(guess, correctGuesses: correctGuesses)
	}

	public func isWinner(guess: Guess, correctGuesses: [String]) -> Bool {
		winner = hasAllLettersGuessed(correctGuesses) || guess.isCorrectlyGuessedFullWord(word)
		return winner
	}

	private func initialScreenView() {
		view.clearScreen()
		view.displayImage(snowManImage, remainingGuesses: maxNumberOfGuesses, maxNumberOfGuesses: maxNumberOfGuesses)
	}

	private func playerTurn(player: Player) {
		let remainingGuesses = guessManager.calculateRemainingGuesses(maxNumberOfGuesses, incorrectGuesses: player.incorrectGuesses)
		view.clearScreen()
		view.displayImage(snowManImage, remainingGuesses: remainingGuesses, maxNumberOfGuesses: maxNumberOfGuesses)
		view.promptPlayerTurn(player.name)
		view.displayRemainingGuesses(remainingGuesses)
		let incorrectGuesses = player.incorrectGuesses
		view.displayIncorrectGuesses(incorrectGuesses)
			
		if !(guessManager.hasNoGuessesRemaining(maxNumberOfGuesses, incorrectGuesses: player.incorrectGuesses)) {
			view.displayBlanks(word, correctGuesses: player.correctGuesses)
			let guess = guessBuilder.buildGuess(view.receiveGuess())
			
			player.appendGuess(word, guess: guess)
			isGameOver(guess, correctGuesses: player.correctGuesses)
		}
	}

	private func hasAllLettersGuessed(correctGuesses: [String]) -> Bool {
		return guessManager.determineUnguessedLetters(word, correctGuesses: correctGuesses).isEmpty
	}

	private func isAllPlayersOutOfGuesses() -> Bool {
		let playersWithRemainingGuesses = players.filter{ !(guessManager.hasNoGuessesRemaining(maxNumberOfGuesses, incorrectGuesses: $0.incorrectGuesses)) }
		return playersWithRemainingGuesses.isEmpty
	}

	private func displayResults() {
		if (winner) {
			view.displayWinningMessage(word)
		} else {
			view.displayLosingMessage(word)
		}
	}
}
