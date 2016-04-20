import Swiftest

Swiftest.register([
	CharacterValidatorSpec.self,
	GameSpec.self,
	GuessSpec.self,
	GuessManagerSpec.self,
	PlayerSpec.self,
	ViewSpec.self,
])

try Swiftest.run()
