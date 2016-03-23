import Swiftest

Swiftest.register([
  	GameSpec.self,
  	DictionaryManagerSpec.self,
  	GuessManagerSpec.self,
  	UISpec.self, 
  	ViewSpec.self
])

try Swiftest.run()
