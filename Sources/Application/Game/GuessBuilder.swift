public class GuessBuilder {

    public init() {}

    public func buildGuess(guess: String) -> Guess {
        return Guess(currentGuess: guess)
    }
}