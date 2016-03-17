import SnowManLogic
import Dictionary

let dictionary = DictionaryManager() 
let guessManager = GuessManager()
let word = dictionary.getRandomWord()

let game = Game(word: word, guessManager: guessManager)
