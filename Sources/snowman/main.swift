import Application
import WordList

let dictionaryManager = DictionaryManager(words: WordList.words)
let word = dictionaryManager.getRandomWord()

let io = IO()

let view = View(io: io)

let guessManager = GuessManager()

let gameSetup = GameSetup(view: view)
let maxNumberOfGuesses = gameSetup.getMaxNumberOfGuesses()

let game = Game(word: word, guessManager: guessManager, view: view, maxNumberOfGuesses: maxNumberOfGuesses)

game.playGame()