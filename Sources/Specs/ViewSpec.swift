import SnowManLogic
import Swiftest

class ViewSpec: Swiftest.Spec {
  	let spec = describe("view logic") {
  		var ui: Receivable!
  		var view: View!
  		before() {
  			ui = MockUI()
  			view = View(ui: ui)
  		}
  		
  		describe("#receiveGuess") {
  			it("should return the guess if it is a letter or word") {
  				expect(view.receiveGuess()).to.equal("hello")
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
                expect(view.assignBlanks(gameWord, correctGuesses: correctGuesses)).to.equal("__  __  __  __  __ ")
            }

            it("should return no blanks if the word has been guessed") {
                correctGuesses = ["h", "e", "l", "o"]
                expect(view.assignBlanks(gameWord, correctGuesses: correctGuesses)).to.equal("h e l l o")
            }

            it("should return blanks and letters for partially guessed word") {
                correctGuesses = ["h", "e"]
                expect(view.assignBlanks(gameWord, correctGuesses: correctGuesses)).to.equal("h e __  __  __ ")
            }

        }
  	}
}