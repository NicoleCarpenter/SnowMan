public class MockView: Viewable {
	var io: Receivable 
	var guess: String!

	public init(io: Receivable) {
		self.io = io
	}

	public func receiveGuess(getGuess: () -> String) -> String {
		guess = String(getGuessFromUser())

		if (guess == "" || !(containsOnlyLetters(guess))) {
			return "false"
		} 
		return "true"
	}

	public func assignBlanks(gameWord: String, correctGuesses: [String]) -> String {
		var blanks = [String]()
		let letters = gameWord.characters.map { String($0) }
		
		for letter in letters { 
			if (correctGuesses.contains(letter)) { 
				blanks.append(letter)  
			} else { 
				blanks.append("__ ") 
			} 
		}
   		return blanks.joinWithSeparator(" ")
	}


	public func getGuessFromUser() -> String {
		return io.getUserInput(io.myReadLine)
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
