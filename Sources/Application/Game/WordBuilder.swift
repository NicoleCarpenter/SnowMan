public class WordBuilder {

    public init() {}

    public func buildWord(word: String) -> Word {
        return Word(gameWord: word)
    }
}