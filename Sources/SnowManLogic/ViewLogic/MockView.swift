public class MockView: Viewable {
	var io: Receivable 
	var guess: String!

	public init(io: Receivable) {
		self.io = io
	}

	public func receiveGuess() -> String {
		guess = io.getUserInput(io.myReadLine)
		if (guess == "") {
			return "Invalid"
		} else if (containsOnlyLetters(guess)) {
			return guess
		} else {
			return "Invalid"
		}
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

	private func containsOnlyLetters(input: String) -> Bool {
   		for character in input.characters {
      			if (!(character >= "a" && character <= "z")) {
         			return false
      			}
   		}
   		return true
	}
}
