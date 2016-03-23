public class View {
	var ui: Receivable 
	var guess = ""

	public init(ui: Receivable) {
		self.ui = ui
	}

	public func receiveGuess() -> String {
		guess = ui.getUserInput()
		if (containsOnlyLetters(guess)) {
			return guess
		} else {
			print("Invalid guess. Please enter a lowercase letter or word.")
			receiveGuess()
		}
		return guess
	}

	public func assignBlanks(gameWord: String, correctGuesses: [String]) -> String {
		var blanks : [String] = []
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