import Application
import WordList
import SetUp

let wordListManager = WordListManager(words: WordList.words)
let word = wordListManager.getRandomWord()

let io = IO()
let validator = CharacterValidator()
let view = View(io: io, validator: validator)

let guessManager = GuessManager()

let playerBuilder = PlayerBuilder()
let wordBuilder = WordBuilder()
let gameSetup = GameSetup(view: view, wordListManager: wordListManager, wordBuilder: wordBuilder, playerBuilder: playerBuilder)
let players = gameSetup.assignPlayers()

let maxNumberOfGuesses = gameSetup.getMaxNumberOfGuesses()
let gameWord = gameSetup.assignGameWord()

let guessBuilder = GuessBuilder()

let game = Game(word: gameWord.gameWord, guessManager: guessManager, view: view, maxNumberOfGuesses: maxNumberOfGuesses, guessBuilder: guessBuilder, players: players)

game.playGame()
