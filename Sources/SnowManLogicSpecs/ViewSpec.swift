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

	        describe("#promptNumberOfGuesses") {
        	        it("should print a prompt requesting number of guesses") {
	                	let outputToPrint = "How many guesses do you want to have for this game?"
        	            	view.promptNumberOfGuesses()

                	    	expect(io.displayCalled).to.equal(true)
                    		expect(io.getPrintedOutputStream).to.equal(outputToPrint)
                	}
            	}
        
       		describe("#receiveNumberOfGuesses") {
                	var errorValue: String!
               		before() {
                    	errorValue = "9999"
                	}

                	it("should return the user input if it is a valid number greater than 0") {
                    		io.stubbedUserInput = ["5"]
                    		expect(view.receiveNumberOfGuesses()).to.equal(5)
                	}

                	it("should return an error value if the user input is a letter") {
                    		io.stubbedUserInput = ["a", errorValue]
                    		expect(view.receiveNumberOfGuesses()).to.equal(Int(errorValue)!)
                	}

                	it("should return an error value if the user input is a word") {
                    		io.stubbedUserInput = ["apple", errorValue]
                    		expect(view.receiveNumberOfGuesses()).to.equal(Int(errorValue)!)
                	}

                	it("should return an error value if the user input is a non-numeric character") {
                    		io.stubbedUserInput = ["a", errorValue]
                    		expect(view.receiveNumberOfGuesses()).to.equal(Int(errorValue)!)
                	}

                	it("should return an error value if the user input is a combination of numbers and non-numbers") {
                    		io.stubbedUserInput = ["5a", "a5", "5?", "?5", errorValue]
                    		expect(view.receiveNumberOfGuesses()).to.equal(Int(errorValue)!)
                	}

                	it("should return an error value if the user input is not a whole number") {
                    		io.stubbedUserInput = ["1.5", errorValue]
                    		expect(view.receiveNumberOfGuesses()).to.equal(Int(errorValue)!)
                	}

                	it("should return an error value if the user input is zero") {
                    		io.stubbedUserInput = ["0", errorValue]
                    		expect(view.receiveNumberOfGuesses()).to.equal(Int(errorValue)!)
                	}

                	it("should return an error value if the user input is a negative number") {
                    		io.stubbedUserInput = ["-1", errorValue]
                    		expect(view.receiveNumberOfGuesses()).to.equal(Int(errorValue)!)
                	}  
            	}

            	describe("#receiveGuess") {
        		it("should return the user input if it is a string of letters") {
            			io.stubbedUserInput = ["hello"]
                    		expect(view.receiveGuess()).to.equal("hello")
           		}

           		it("should return the user input if it is a single letter") {
                		io.stubbedUserInput = ["a"]
                		expect(view.receiveGuess()).to.equal("a")
            		}

            		it("should return an error message if the user input is a number") {   
                		io.stubbedUserInput = ["1", "fail"]
                		expect(view.receiveGuess()).to.equal("fail")
            		}

                	it("should return an error message if the user input is a non-letter character") {
                        	io.stubbedUserInput = ["?", "fail"]
                        	expect(view.receiveGuess()).to.equal("fail")
                    	}

                    	it("should return an error message if the user input is a combination of valid and invalid inputs") {
                        	io.stubbedUserInput = ["?a", "fail"]
                        	expect(view.receiveGuess()).to.equal("fail")
                    	}

                    	it("should return an error message if the user hits return") {
                        	io.stubbedUserInput = ["", "fail"]
                        	expect(view.receiveGuess()).to.equal("fail")
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
        		it("should return the number of guesses remaining") {
                    		var remainingGuesses = 4
                            	var outputToPrint = ("You have \(remainingGuesses) remaining guesses")
                            	view.displayRemainingGuesses(4)
                    		
                            	expect(io.displayCalled).to.equal(true)
                            	expect(io.getPrintedOutputStream).to.equal(outputToPrint)
                
                    		remainingGuesses = 0
                    		outputToPrint = ("You have \(remainingGuesses) remaining guesses")
                            	view.displayRemainingGuesses(0)    

                            	expect(io.displayCalled).to.equal(true)
                            	expect(io.getPrintedOutputStream).to.equal(outputToPrint)
                    	}
            	}

            	describe("#displayWinningMessage") {
 	        	it("should print a congratulatory message if winning conditions met") {
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
