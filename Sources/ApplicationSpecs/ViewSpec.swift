import Application
import Swiftest

class ViewSpec: Swiftest.Spec {
  	let spec = describe("View logic") {
		var io: MockIO!
    		var view: View!
    		before() {
			io = MockIO()
   		 	view = View(io: io)
    		}

        	describe("#promptMaxNumberOfGuesses") {
        	    	it("should print a prompt requesting number of guesses") {
        	        	let outputToPrint = "How many guesses do you want to have for this game?"
        	        	view.promptMaxNumberOfGuesses()
	
	                	expect(io.displayCalled).to.equal(true)
	                	expect(io.getPrintedOutputStream).to.equal(outputToPrint)
	            	}
	        }

	        describe("#receiveMaxNumberOfGuesses") {
	            	var errorValue: String!
	            	before() {
	                	errorValue = "9999"
	            	}

	            	it("should return the user input if it is a valid number greater than 0") {
       		         	io.stubbedUserInput = ["5"]
                		expect(io.displayCalled).to.equal(false)
                		expect(view.receiveMaxNumberOfGuesses()).to.equal(5)
            		}

            		it("should return an error value if the user input is a letter") {
                		io.stubbedUserInput = ["a", errorValue]
                		expect(view.receiveMaxNumberOfGuesses()).to.equal(Int(errorValue)!)
                		expect(io.displayCalled).to.equal(true)
            		}

        	    	it("should return an error value if the user input is a word") {
	                	io.stubbedUserInput = ["apple", errorValue]
	                	expect(view.receiveMaxNumberOfGuesses()).to.equal(Int(errorValue)!)
	                	expect(io.displayCalled).to.equal(true)
	            	}

	            	it("should return an error value if the user input is a non-numeric character") {
	                	io.stubbedUserInput = ["a", errorValue]
	                	expect(view.receiveMaxNumberOfGuesses()).to.equal(Int(errorValue)!)
	                	expect(io.displayCalled).to.equal(true)
	            	}

	            	it("should return an error value if the user input is a combination of numbers and non-numbers") {
				io.stubbedUserInput = ["5a", "a5", "5?", "?5", errorValue]
                		expect(view.receiveMaxNumberOfGuesses()).to.equal(Int(errorValue)!)
                		expect(io.displayCalled).to.equal(true)
            		}

            		it("should return an error value if the user input is not a whole number") {
               	 		io.stubbedUserInput = ["1.5", errorValue]
                		expect(view.receiveMaxNumberOfGuesses()).to.equal(Int(errorValue)!)
                		expect(io.displayCalled).to.equal(true)
            		}

            		it("should return an error value if the user input is zero") {
                		io.stubbedUserInput = ["0", errorValue]
                		expect(view.receiveMaxNumberOfGuesses()).to.equal(Int(errorValue)!)
                		expect(io.displayCalled).to.equal(true)
            		}

            		it("should return an error value if the user input is a negative number") {
                		io.stubbedUserInput = ["-1", errorValue]
                		expect(view.receiveMaxNumberOfGuesses()).to.equal(Int(errorValue)!)
                		expect(io.displayCalled).to.equal(true)
            		}  
        	}


    
   		describe("#receiveGuess") {
   			it("should return the user input if it is a string of letters") {
   				io.stubbedUserInput = ["hello"]
   				let guess = view.receiveGuess()
       				expect(io.displayCalled).to.equal(false)
   				expect(guess.currentGuess).to.equal("hello")
   			}

    			it("should return the user input if it is a single letter") {
     				io.stubbedUserInput = ["a"]
        			let guess = view.receiveGuess()
   			        expect(io.displayCalled).to.equal(false)
     				expect(guess.currentGuess).to.equal("a")
        		}

     			it("should return an error message if the user input is a number") {
      				io.stubbedUserInput = ["1", "fail"]
        			let guess = view.receiveGuess()
        		        expect(io.displayCalled).to.equal(true)
       				expect(guess.currentGuess).to.equal("fail")
       			}

    			it("should return an error message if the user input is a non-letter character") {
       				io.stubbedUserInput = ["?", "fail"]
        			let guess = view.receiveGuess()
                		expect(io.displayCalled).to.equal(true)
       				expect(guess.currentGuess).to.equal("fail")
    			}

    			it("should return an error message if the user input is a combination of valid and invalid inputs") {
       				io.stubbedUserInput = ["?a", "fail"]
       				let guess = view.receiveGuess()
                		expect(io.displayCalled).to.equal(true)
      				expect(guess.currentGuess).to.equal("fail")
    			}

    			it("should return an error message if the user hits return") {
       				io.stubbedUserInput = ["", "fail"]
       				let guess = view.receiveGuess()
                		expect(io.displayCalled).to.equal(true)
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
    			it("should return the number of guesses remaining") {
        			let remainingGuesses = 4
        			view.displayRemainingGuesses(remainingGuesses)
                		let outputToPrint = "You have \(remainingGuesses) remaining guesses"

	        		expect(io.displayCalled).to.equal(true)
	        		expect(io.getPrintedOutputStream).to.equal(outputToPrint)
	    		}

    			it("should return 0 guesses remaining if no guesses remain") {
        			let remainingGuesses = 0
        			view.displayRemainingGuesses(remainingGuesses)
        	        	let outputToPrint = "You have \(remainingGuesses) remaining guesses"

	        		expect(io.displayCalled).to.equal(true)
	        		expect(io.getPrintedOutputStream).to.equal(outputToPrint)
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
