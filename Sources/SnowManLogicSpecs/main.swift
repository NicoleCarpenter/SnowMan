import Swiftest

Swiftest.register([
  	GameSpec.self,
  	GuessSpec.self,
  	GuessManagerSpec.self, 
  	ViewSpec.self
])

try Swiftest.run()
