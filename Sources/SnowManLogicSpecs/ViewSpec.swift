import SnowManLogic
import Swiftest

class ViewSpec: Swiftest.Spec {
  	let spec = describe("View logic") {
  		var ui: MockUI!
        	var mockView: MockView!
	        before() {
			ui = MockUI()
       		 	mockView = MockView(ui: ui)
        	}
        
       		describe("#receiveGuess") {
        		it("should return the user input if it is a string of letters") {
        			ui.getUserInputReturn = "hello"
                		expect(mockView.receiveGuess()).to.equal("hello")
            		}

           		it("should return the user input if it is a single letter") {
                		ui.getUserInputReturn = "a"
                		expect(mockView.receiveGuess()).to.equal("a")
            		}

            		it("should return an error message if the user input is something other than a letter or word") {   
                		ui.getUserInputReturn = "1"
                		expect(mockView.receiveGuess()).to.equal("Invalid")
            		}
        	}

        	describe("#assignBlanks") {
            		var gameWord: String!
            		var correctGuesses: [String]!
            
            		before() {
                		gameWord = "hello"
                		correctGuesses = []
            		}
            
            		it("should return only blanks for unguessed word") {
                		expect(mockView.assignBlanks(gameWord, correctGuesses: correctGuesses)).to.equal("__  __  __  __  __ ")
            		}

            		it("should return no blanks if the word has been guessed") {
                		correctGuesses = ["h", "e", "l", "o"]
                		expect(mockView.assignBlanks(gameWord, correctGuesses: correctGuesses)).to.equal("h e l l o")
            		}

            		it("should return blanks and letters for partially guessed word") {
                		correctGuesses = ["h", "e"]
                		expect(mockView.assignBlanks(gameWord, correctGuesses: correctGuesses)).to.equal("h e __  __  __ ")
            		}

        	}
  	}
}
