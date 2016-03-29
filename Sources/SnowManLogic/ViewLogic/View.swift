public class View: Viewable {
	var io: Interactable

	public init(io: Interactable) {
		self.io = io
	}

	public func receiveGuess() -> String {
		var guess = io.getUserInput()
		while (guess == "" || !(containsOnlyLetters(guess))) {
			io.display("Invalid guess. Please enter a lowercase letter or word.")
			guess = io.getUserInput()
		} 
		return guess
	}

	public func assignBlanks(gameWord: String, correctGuesses: [String]) -> String {
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
   		return assignedBlanks
	}

	public func displayRemainingGuesses(remainingGuesses: Int) -> String {
		let message = "You have \(remainingGuesses) remaining guesses"
		io.display(message)
		return message
	}

	public func displayWinningMessage(word: String) -> String {
		let message = "Congratulations. You win! You correctly guessed \"\(word)\""
		io.display(message)
		return message
	}

	public func displayLosingMessage(word: String) -> String {
		let message = "Game Over. You ran out of guesses. The word was \"\(word)\""
		io.display(message)
		return message
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
