public class View: Viewable {
	var io: Receivable
	var guess: String!

	public init(io: Receivable) {
		self.io = io
	}

	public func receiveGuess() -> String {
		guess = io.getUserInput(io.myReadLine)
		if (guess == "" || !(containsOnlyLetters(guess))) {
			io.display("Invalid guess. Please enter a lowercase letter or word.")
			receiveGuess()
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

	public func displayRemainingGuesses(remainingGuesses: Int) {
		io.display("You have \(remainingGuesses) remaining guesses")
	}

	public func displayResults(word: String, winner: Bool) {
		if (winner) {
			io.display("Congratulations. You win! You correctly guessed \"\(word)\"")
		} else {
			io.display("Game Over. You ran out of guesses. The word was \"\(word)\"")
		}
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
