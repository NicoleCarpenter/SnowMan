public class View {
	public init() {
	}

	public func printWord(word: String) {
		print(word)
	}

	public func printBlanks(gameWord: String, correctGuesses: [String]) {
		var blanks : [String] = []
		let letters = gameWord.characters.map { String($0) }
		
		for letter in letters { 
			if (correctGuesses.contains(letter)) { 
           		blanks.append(letter)  
       		} else { 
           		blanks.append("__ ") 
       		} 
   		}
   		print(blanks.joinWithSeparator(" "))
	}

}