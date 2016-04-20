import Application
import Swiftest

class PlayerSpec: Swiftest.Spec {
    let spec = describe("player logic") {
        describe("#appendGuess") {
            var word: String!
            var player: Player!
            before() {
                word = "apple"
                player = Player(name: "Bob", order: 1, correctGuesses: [], incorrectGuesses: [])
            }

            it("should add word to correctGuesses if it is a correctly guessed word") {
                let guess = Guess(currentGuess: "apple")
                player.appendGuess(word, guess: guess)
                expect(player.correctGuesses).to.contain(guess.currentGuess)
                expect(player.incorrectGuesses).notTo.contain(guess.currentGuess)
            }

            it("should add word to correctGuesses if it is a correctly guessed word, regardless of case") {
                let guess = Guess(currentGuess: "APPLE")
                player.appendGuess(word, guess: guess)
                expect(player.correctGuesses).to.contain(guess.currentGuess)
                expect(player.incorrectGuesses).notTo.contain(guess.currentGuess)
            }

            it("should add word to incorrectGuesses if it is an incorrectly guessed word") {
                let guess = Guess(currentGuess: "banana")
                player.appendGuess(word, guess: guess)
                expect(player.incorrectGuesses).to.contain(guess.currentGuess)
                expect(player.correctGuesses).notTo.contain(guess.currentGuess)
            }

            it("should add guess to correctGuesses collection if it is in the word") {
                let guess = Guess(currentGuess: "a")
                player.appendGuess(word, guess: guess)
                expect(player.correctGuesses).to.contain(guess.currentGuess)
                expect(player.incorrectGuesses).notTo.contain(guess.currentGuess)
            }

            it("should add guess to correctGuesses collection if it is in the word") {
                let guess = Guess(currentGuess: "A")
                player.appendGuess(word, guess: guess)
                expect(player.correctGuesses).to.contain(guess.currentGuess)
                expect(player.incorrectGuesses).notTo.contain(guess.currentGuess)
            }

            it("should not add guess to correctGuesses collection if it is not in the word") {
                let guess = Guess(currentGuess: "b")
                player.appendGuess(word, guess: guess)
                expect(player.incorrectGuesses).to.contain(guess.currentGuess)
                expect(player.correctGuesses).notTo.contain(guess.currentGuess)
            }
        }
    }
}
