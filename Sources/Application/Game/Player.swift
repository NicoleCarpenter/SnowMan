public class Player {
    public var name: String
    public var order: Int
    public var correctGuesses: [String]
    public var incorrectGuesses: [String]

    public init(name: String, order: Int, correctGuesses: [String], incorrectGuesses: [String]) {
        self.name = name
        self.order = order
        self.correctGuesses = correctGuesses
        self.incorrectGuesses = incorrectGuesses
    }

    public func appendGuess(word: String, guess: Guess) {
        if guess.isCorrect(word) {
            correctGuesses.append(guess.currentGuess.lowercaseString)
            correctGuesses.append(guess.currentGuess.uppercaseString)
        } else {
            incorrectGuesses.append(guess.currentGuess)
        }
    }
}