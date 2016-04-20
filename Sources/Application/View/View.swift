public class View: Viewable {
	var io: Interactable
	var validator: CharacterValidator

	public init(io: Interactable, validator: CharacterValidator) {
		self.io = io
		self.validator = CharacterValidator()
	}

	public func promptNumberOfPlayers(options: [String]) {
		io.display("How many players are playing this round?")
		for option in options {
			io.display("\(option)")
		}
	}

	public func receiveSelectionType(numberOfOptions: Int) -> Int{
		var selectionType = io.getUserInput()
		while (selectionType == "" || !(validSelection(selectionType, numberOfOptions: numberOfOptions))) {
			io.display("Invalid selection.")
			selectionType = io.getUserInput()
		}
		return Int(selectionType)!
	}

	public func promptReceivePlayerName() {
		io.display("What is your name?")
	}

	public func receivePlayerName() -> String {
		promptReceivePlayerName()
		return io.getUserInput()
	}

	public func promptMaxNumberOfGuesses() {
		io.display("How many guesses do you want to have for this game?")
	}

	public func receiveMaxNumberOfGuesses() -> Int {
		var maxNumberOfGuesses = io.getUserInput()
		while (maxNumberOfGuesses == "" || !(validNumber(maxNumberOfGuesses))) {
			io.display("Invalid number. Please enter a number greater than 0")
			maxNumberOfGuesses = io.getUserInput()
		}
		return Int(maxNumberOfGuesses)!
	}

	public func promptWordSelectionType(options: [String]) {
		io.display("Would you like a randomly selected word or phrase, or would you like a friend to select one?")
		for option in options {
			io.display("\(option)")
		}
	}

	public func promptReceiveWord() {
		io.display("What is your word?")
	}

	public func receiveWord() -> String {
		var word = io.getUserInput()
		while !(validator.hasOnlyLetters(word)) || validator.isCarraigeReturnOrSpace(word) {
			io.display("Invalid word. Please enter a valid word that does not contain numbers or symbols.")
			word = io.getUserInput()
		}
		return word
	}

	public func receiveGuess() -> String {
		var guess = io.getUserInput()
		while !(validator.hasOnlyLetters(guess)) || validator.isCarraigeReturnOrSpace(guess) {
			io.display("Invalid guess. Please enter a letter or word.")
			guess = io.getUserInput()
		}
		return guess
	}

	public func displayBlanks(gameWord: String, correctGuesses: [String]) {
		var blanks: [String] = []
		let letters = gameWord.characters.map { String($0) }
		for letter in letters {
			if (correctGuesses.contains(letter)) {
				blanks.append(letter)
			} else if (letter == " ") {
				blanks.append(" ")
			} else {
				blanks.append("__ ")
			}
		}
		let assignedBlanks = blanks.joinWithSeparator(" ")
		io.display(assignedBlanks)
	}

	public func displayImage(image: [String], remainingGuesses: Int, maxNumberOfGuesses: Int) {
		var image = image
		let linesToDeletePerIncorrectGuess = calculateLinesToDeletePerIncorrectGuess(image, maxNumberOfGuesses: maxNumberOfGuesses)
		let numberOfIncorrectGuessesMade = calculateIncorrectGuessesMade(remainingGuesses, maxNumberOfGuesses: maxNumberOfGuesses)
		let totalLinesToDelete = calculateTotalLinesToDelete(numberOfIncorrectGuessesMade, linesToDeletePerIncorrectGuess: linesToDeletePerIncorrectGuess)

		let blanks = Array(count: totalLinesToDelete, repeatedValue:"")
		image = getAdjustedImage(image, totalLinesToDelete: totalLinesToDelete)

		displayBlanks(blanks)
		displayImageLines(image)
	}

	public func promptPlayerTurn(name: String) {
		io.display("\(name), it's your turn!")
	}

	public func displayRemainingGuesses(remainingGuesses: Int) {
		io.display("You have \(remainingGuesses) remaining guesses")
	}

	public func displayIncorrectGuesses(incorrectGuesses: [String]) {
		io.display("Incorrect guesses: \(incorrectGuesses.joinWithSeparator("  "))")
	}

	public func displayWinningMessage(word: String) {
		io.display("Congratulations. You win! You correctly guessed \"\(word)\"")
	}

	public func displayLosingMessage(word: String) {
		io.display("Game Over. You ran out of guesses. The word was \"\(word)\"")
	}

	public func clearScreen() {
		io.clear()
	}

	private func validNumber(input: String) -> Bool {
		return Int(input) != nil && Int(input) > 0
	}

	private func calculateLinesToDeletePerIncorrectGuess(image: [String], maxNumberOfGuesses: Int) -> Int {
		return image.count / maxNumberOfGuesses
	}

	private func calculateIncorrectGuessesMade(remainingGuesses: Int, maxNumberOfGuesses: Int) -> Int {
		return maxNumberOfGuesses - remainingGuesses
	}

	private func calculateTotalLinesToDelete(numberOfIncorrectGuessesMade: Int, linesToDeletePerIncorrectGuess: Int) -> Int {
		return numberOfIncorrectGuessesMade * linesToDeletePerIncorrectGuess
	}

	private func getAdjustedImage(image: [String], totalLinesToDelete: Int) -> [String]{
		var image = image
		image.removeLast(totalLinesToDelete)
		return image
	}

	private func displayBlanks(blanks: [String]) {
		for blank in blanks {
			io.display(blank)
		}
	}

	private func displayImageLines(image: [String]) {
		for line in image {
			io.display(line)
		}
	}

	private func validSelection(input: String, numberOfOptions: Int) -> Bool {
		return Int(input) != nil && Int(input) > 0 && Int(input) <= numberOfOptions
	}
}
