import SnowManLogic
import SnowManDictionary

let dictionaryManager = DictionaryManager(words: SnowManDictionary.words) 
let word = dictionaryManager.getRandomWord()

let io = IO()

let view = View(io: io)

let numberOfGuesses = view.receiveNumberOfGuesses()
let guessManager = GuessManager(numberOfGuesses: numberOfGuesses)

let game = Game(word: word, guessManager: guessManager, view: view)

game.playGame()