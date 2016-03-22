import SnowManLogic
import Dictionary

let dictionaryManager = DictionaryManager() 
let guessManager = GuessManager(totalIncorrectGuessesAllowed: 10)
let word = dictionaryManager.getRandomWord()

let game = Game(word: word, guessManager: guessManager)