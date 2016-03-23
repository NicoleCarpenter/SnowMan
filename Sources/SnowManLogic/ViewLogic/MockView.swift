public class MockView {
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
			return "Invalid"
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
