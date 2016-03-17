import SnowManLogic
import Dictionary

let dictionary = DictionaryManager() 
let word = dictionary.getRandomWord()
let game = Game(word: word)
