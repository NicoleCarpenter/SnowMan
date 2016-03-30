import Application

extension Guess: Equatable {
}

public func ==(l: Guess, r: Guess) -> Bool {
	return l.currentGuess == r.currentGuess
}