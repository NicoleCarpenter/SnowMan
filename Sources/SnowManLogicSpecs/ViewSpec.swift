import SnowManLogic
import Swiftest

class ViewSpec: Swiftest.Spec {
  	let spec = describe("View logic") {
		var io: MockIO!
        	var view: View!
	        before() {
			io = MockIO()
       		 	view = View(io: io)
        	}
        
       		describe("#receiveGuess") {
        		it("should return the user input if it is a string of letters") {
            		io.stubbedUserInput = ["hello"]
                    expect(view.receiveGuess(io.myReadLine)).to.equal("hello")
           		}

           		it("should return the user input if it is a single letter") {
                		io.stubbedUserInput = ["a"]
                		expect(view.receiveGuess(io.myReadLine)).to.equal("a")
            		}

            		it("should return an error message if the user input is a number") {   
                		io.stubbedUserInput = ["1", "fail"]
                		expect(view.receiveGuess(io.myReadLine)).to.equal("fail")
            		}

                	it("should return an error message if the user input is a non-letter character") {
                        	io.stubbedUserInput = ["?", "fail"]
                        	expect(view.receiveGuess(io.myReadLine)).to.equal("fail")
                    	}

                    	it("should return an error message if the user input is a combination of valid and invalid inputs") {
                        	io.stubbedUserInput = ["?a", "fail"]
                        	expect(view.receiveGuess(io.myReadLine)).to.equal("fail")
                    	}

                    	it("should return an error message if the user hits return") {
                        	io.stubbedUserInput = ["", "fail"]
                        	expect(view.receiveGuess(io.myReadLine)).to.equal("fail")
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

	        describe("#displayRemainingGuesses") {
        		it("should return the number of guesses remaining") {
                    		var remainingGuesses = 4
                    		expect(view.displayRemainingGuesses(4)).to.equal("You have 4 remaining guesses")
                
                    		remainingGuesses = 0
                    		expect(view.displayRemainingGuesses(0)).to.equal("You have 0 remaining guesses")
                	}
            	}

            describe("#displayWinningMessage") {
                it("should print a congragulatory message if winning conditions met") {
                    let gameWord = "hello"
                    expect(view.displayWinningMessage(gameWord)).to.equal("Congratulations. You win! You correctly guessed \"hello\"")
                }
            }

            describe("#displayLosingMessage") {
                it("should inform player of loss if winning conditions not met") {
                    let gameWord = "hello"
                    expect(view.displayLosingMessage(gameWord)).to.equal("Game Over. You ran out of guesses. The word was \"hello\"")
                }
            }
  	}
}
