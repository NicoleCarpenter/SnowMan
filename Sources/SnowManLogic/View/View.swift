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

	private func containsOnlyLetters(input: String) -> Bool {
   		for character in input.characters {
      		if (!(character >= "a" && character <= "z")) {
         		return false
      		}
   		}
   		return true
	}
}