import Application
import WordList

public class GameSetup {
	let view: Viewable
	let wordListManager: WordListManager
	let wordBuilder: WordBuilder
	let playerBuilder: PlayerBuilder
	
	public init(view: Viewable, wordListManager: WordListManager, wordBuilder: WordBuilder, playerBuilder: PlayerBuilder) {
		self.view = view
		self.wordListManager = wordListManager
		self.wordBuilder = wordBuilder
		self.playerBuilder = playerBuilder
	}

	public func assignPlayers() -> [Player] {
		var players: [Player] = []
		let options = ["[1]", "[2]"]
		let type = getGamePlayType(options)
		players.append(playerBuilder.buildPlayer(view.receivePlayerName(), order: 1, correctGuesses: [], incorrectGuesses: []))
		if type == 2 {
			players.append(playerBuilder.buildPlayer(view.receivePlayerName(), order: 2, correctGuesses: [], incorrectGuesses: []))
		}
		return players
	}

	public func assignGameWord() -> Application.Word {
		let options = ["[1] Random", "[2] Select"]
		let type = getWordSelectionType(options)
		if type == 1 {
			return wordBuilder.buildWord(wordListManager.getRandomWord())
		} else {
			view.promptReceiveWord()
			return wordBuilder.buildWord(view.receiveWord())
		}
	}

	public func getMaxNumberOfGuesses() -> Int {
		view.promptMaxNumberOfGuesses()
		return Int(view.receiveMaxNumberOfGuesses())
	}

	private func getGamePlayType(options: [String]) -> Int {
		view.promptNumberOfPlayers(options)
		return view.receiveSelectionType(options.count)
	}

	private func getWordSelectionType(options: [String]) -> Int {
		view.promptWordSelectionType(options)
		return view.receiveSelectionType(options.count)
	}
}
