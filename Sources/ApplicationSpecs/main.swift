import Swiftest

Swiftest.register([
	GameSetupSpec.self,
  	GameSpec.self,
  	GuessManagerSpec.self, 
  	ViewSpec.self
])

try Swiftest.run()
