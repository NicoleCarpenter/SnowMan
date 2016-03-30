import Swiftest

Swiftest.register([
	GameSetupSpec.self,
  	GameSpec.self,
  	GuessSpec.self,
  	GuessManagerSpec.self, 
  	ViewSpec.self
])

try Swiftest.run()
