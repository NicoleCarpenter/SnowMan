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
	                        let guess = view.receiveGuess()
                    		expect(guess.currentGuess).to.equal("hello")
           		}

           		it("should return the user input if it is a single letter") {
                		io.stubbedUserInput = ["a"]
	                        let guess = view.receiveGuess()                        
                		expect(guess.currentGuess).to.equal("a")
            		}

            		it("should return an error message if the user input is a number") {   
                		io.stubbedUserInput = ["1", "fail"]
       		                let guess = view.receiveGuess()
                		expect(guess.currentGuess).to.equal("fail")
            		}

                	it("should return an error message if the user input is a non-letter character") {
                        	io.stubbedUserInput = ["?", "fail"]
                	        let guess = view.receiveGuess()
                        	expect(guess.currentGuess).to.equal("fail")
                    	}

                    	it("should return an error message if the user input is a combination of valid and invalid inputs") {
                        	io.stubbedUserInput = ["?a", "fail"]
                            	let guess = view.receiveGuess()
                        	expect(guess.currentGuess).to.equal("fail")
                    	}

                    	it("should return an error message if the user hits return") {
                        	io.stubbedUserInput = ["", "fail"]
                            	let guess = view.receiveGuess()
                        	expect(guess.currentGuess).to.equal("fail")
                    	}
        	}

        	describe("#assignBlanks") {
            		var gameWord: String!            
            		before() {
                		gameWord = "hello"
            		}
            
            		it("should return only blanks for unguessed word") {
        	                let correctGuesses: [String] = []
                	        let outputToPrint = "__  __  __  __  __ "
        	                view.assignBlanks(gameWord, correctGuesses: correctGuesses)
                		
                	        expect(io.displayCalled).to.equal(true)
                        	expect(io.getPrintedOutputStream).to.equal(outputToPrint)
            		}

            		it("should return no blanks if the word has been guessed") {
                		let correctGuesses = ["h", "e", "l", "o"]
                        	let outputToPrint = "h e l l o"
                        	view.assignBlanks(gameWord, correctGuesses: correctGuesses)
                		
                       		expect(io.displayCalled).to.equal(true)
                        	expect(io.getPrintedOutputStream).to.equal(outputToPrint)
            		}

            		it("should return blanks and letters for partially guessed word") {
                		let correctGuesses = ["h", "e"]
                        	let outputToPrint = "h e __  __  __ "
                        	view.assignBlanks(gameWord, correctGuesses: correctGuesses)
                		
                        	expect(io.displayCalled).to.equal(true)
                        	expect(io.getPrintedOutputStream).to.equal(outputToPrint)
            		}

        	}

	        describe("#displayRemainingGuesses") {
        		it("should return the number of guesses remaining if more than 0 guesses remain") {
                    		let remainingGuesses = 4
                            	view.displayRemainingGuesses(remainingGuesses)
                    		
                            	expect(io.displayCalled).to.equal(true)
                            	expect(io.getPrintedOutputStream).to.equal("You have \(remainingGuesses) remaining guesses")
                        }

                        it("should return 0 guesses remaining if no guesses remain") {
                    		let remainingGuesses = 0
                            	view.displayRemainingGuesses(remainingGuesses)    

                            	expect(io.displayCalled).to.equal(true)
                            	expect(io.getPrintedOutputStream).to.equal("You have \(remainingGuesses) remaining guesses")
                    	}
            	}

                describe("#displayIncorrectGuesses") {
	                it("should print out the incorrect guesses if there are any") {
        	                var incorrectGuesses = ["a", "b", "apple"]
                	        view.displayIncorrectGuesses(incorrectGuesses)

                        	expect(io.displayCalled).to.equal(true)
                        	expect(io.getPrintedOutputStream).to.equal("Incorrect guesses: \(incorrectGuesses.joinWithSeparator("  "))")
                    	}
                }

            	describe("#displayWinningMessage") {
 	        	it("should print a congragulatory message if winning conditions met") {
				let gameWord = "hello"
                    		let outputToPrint = ("Congratulations. You win! You correctly guessed \"\(gameWord)\"")
	                        view.displayWinningMessage(gameWord)

                    		expect(io.displayCalled).to.equal(true)
                            	expect(io.getPrintedOutputStream).to.equal(outputToPrint)
                	}
            	}

            	describe("#displayLosingMessage") {
                	it("should inform player of loss if winning conditions not met") {
                    		let gameWord = "hello"
                            	let outputToPrint = ("Game Over. You ran out of guesses. The word was \"\(gameWord)\"")
                                view.displayLosingMessage(gameWord)

                            	expect(io.displayCalled).to.equal(true)
                            	expect(io.getPrintedOutputStream).to.equal(outputToPrint)
                	}
            	}
  	}
}
