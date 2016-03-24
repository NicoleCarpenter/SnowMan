import SnowManLogic
import Dictionary

let dictionaryManager = DictionaryManager(words: words) 
let guessManager = GuessManager(totalIncorrectGuessesAllowed: 10)
let word = dictionaryManager.getRandomWord()

let ui = UI()
let view = View(ui: ui)
let game = Game(word: word, guessManager: guessManager, view: view)