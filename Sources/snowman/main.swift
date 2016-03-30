import SnowManLogic
import SnowManDictionary

let dictionaryManager = DictionaryManager(words: SnowManDictionary.words) 
let guessManager = GuessManager(totalIncorrectGuessesAllowed: 10)
let word = dictionaryManager.getRandomWord()

let io = IO()
let view = View(io: io)
let game = Game(word: word, guessManager: guessManager, view: view)

game.playGame()