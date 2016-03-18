import Swiftest

Swiftest.register([
  	GameSpec.self,
  	DictionaryManagerSpec.self,
  	GuessManagerSpec.self,
  	ViewSpec.self
])

try Swiftest.run()
