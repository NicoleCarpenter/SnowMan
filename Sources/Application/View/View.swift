public class View: Viewable {
	var io: Interactable

	public init(io: Interactable) {
		self.io = io
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

	public func receiveGuess() -> String {
		var guess = io.getUserInput()
		while (guess == "" || !(containsOnlyLetters(guess))) {
			io.display("Invalid guess. Please enter a lowercase letter or word.")
			guess = io.getUserInput()
		} 
		return guess
	}

	public func assignBlanks(gameWord: String, correctGuesses: [String]) {
		var blanks: [String] = []
		let letters = gameWord.characters.map { String($0) }
		
		for letter in letters { 
			if (correctGuesses.contains(letter)) { 
	           		blanks.append(letter)  
       			} else { 
           			blanks.append("__ ") 
       			} 
   		}
   		let assignedBlanks = blanks.joinWithSeparator(" ")
   		io.display(assignedBlanks)
	}

	public func displayRemainingGuesses(remainingGuesses: Int) {
		io.display("You have \(remainingGuesses) remaining guesses")
	}

	public func displayWinningMessage(word: String) {
		io.display("Congratulations. You win! You correctly guessed \"\(word)\"")
	}

	public func displayLosingMessage(word: String) {
		io.display("Game Over. You ran out of guesses. The word was \"\(word)\"")
	}

	private func validNumber(input: String) -> Bool {
		return Int(input) != nil && Int(input) > 0
	}

	private func containsOnlyLetters(input: String) -> Bool {
   		for character in input.characters {
      			if (!(character >= "a" && character <= "z")) {
         			return false
      			}
   		}
   		return true
	}
}
