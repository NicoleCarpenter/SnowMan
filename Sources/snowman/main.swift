import Application
import WordList

let dictionaryManager = DictionaryManager(words: WordList.words)
let word = dictionaryManager.getRandomWord()

let io = IO()

let view = View(io: io)

view.promptNumberOfGuesses()
let numberOfGuesses = view.receiveNumberOfGuesses()
let guessManager = GuessManager(numberOfGuesses: numberOfGuesses)

let game = Game(word: word, guessManager: guessManager, view: view)

game.playGame()