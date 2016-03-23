import Swiftest

Swiftest.register([
  	GameSpec.self,
  	GuessManagerSpec.self,
  	UISpec.self, 
  	ViewSpec.self
])

try Swiftest.run()
