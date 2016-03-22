public class View {
	var ui: UI 

	public init(ui: UI) {
		self.ui = ui
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