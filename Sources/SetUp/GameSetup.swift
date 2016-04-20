import Application
import WordList

public class GameSetup {
	let view: Viewable
	let wordListManager: WordListManager
	let wordBuilder: WordBuilder
	public init(view: Viewable, wordListManager: WordListManager, wordBuilder: WordBuilder) {
		self.view = view
		self.wordListManager = wordListManager
		self.wordBuilder = wordBuilder
	}

	public func getMaxNumberOfGuesses() -> Int {
		view.promptMaxNumberOfGuesses()
		return Int(view.receiveMaxNumberOfGuesses())
	}

	public func assignGameWord() -> Application.Word {
		let numberOfOptions = 2
		let type = getWordSelectionType(numberOfOptions)
		if type == 1 {
			return wordBuilder.buildWord(wordListManager.getRandomWord())
		} else {
			view.promptReceiveWord()
			return wordBuilder.buildWord(view.receiveWord())
		}
	}

	private func getWordSelectionType(numberOfOptions: Int) -> Int {
		view.promptWordSelectionType()
		return view.receiveSelectionType(numberOfOptions)
	}
}
