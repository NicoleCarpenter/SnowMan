import Swiftest

Swiftest.register([
    CharacterValidatorSpec.self,
	GameSpec.self,
	GuessSpec.self,
	GuessManagerSpec.self,
	ViewSpec.self,
])

try Swiftest.run()
