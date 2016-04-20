import SetUp
import Application

extension Player: Equatable {}

public func ==(l: Player, r: Player) -> Bool {
    return l.name == r.name && l.order == r.order && l.correctGuesses == r.correctGuesses && l.incorrectGuesses == r.incorrectGuesses
}