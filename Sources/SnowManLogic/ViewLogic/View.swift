public class View: Viewable {
	var io: Receivable 
	var guess: String!

	public init(io: Receivable) {
		self.io = io
	}

	public func receiveGuess() -> String {
		guess = io.getUserInput()
		if (containsOnlyLetters(guess)) {
			return guess
		} else {
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

	private func containsOnlyLetters(input: String) -> Bool {
   		for character in input.characters {
      			if (!(character >= "a" && character <= "z")) {
         			return false
      			}
   		}
   		return true
	}
}
