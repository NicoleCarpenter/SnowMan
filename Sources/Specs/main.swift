import Swiftest

Swiftest.register([
  	GameSpec.self,
  	DictionaryManagerSpec.self,
  	GuessManagerSpec.self,
  	UISpec.self
])

try Swiftest.run()
