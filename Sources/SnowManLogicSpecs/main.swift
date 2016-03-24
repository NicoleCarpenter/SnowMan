import Swiftest

Swiftest.register([
  	GameSpec.self,
  	GuessManagerSpec.self,
  	IOSpec.self, 
  	ViewSpec.self
])

try Swiftest.run()
