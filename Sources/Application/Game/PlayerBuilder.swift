public class PlayerBuilder {

    public init() {}

    public func buildPlayer(name: String, order: Int, correctGuesses: [String], incorrectGuesses: [String]) -> Player {
        return Player(  name: name, 
                        order: order, 
                        correctGuesses: correctGuesses, 
                        incorrectGuesses: incorrectGuesses)
    }
}