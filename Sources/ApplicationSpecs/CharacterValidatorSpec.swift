import Application
import Swiftest

class CharacterValidatorSpec: Swiftest.Spec {
    let spec = describe("character validator logic") {
        var characterValidator: CharacterValidator!
        before() {
            characterValidator = CharacterValidator()
        }

        describe("#isCarraigeReturnOrSpace") {

            it("should return true if it is an empty string") {
                let guess = ""
                expect(characterValidator.isCarraigeReturnOrSpace(guess)).to.equal(true)
            }

            it("should return true if it is a space") {
                let guess = " "
                expect(characterValidator.isCarraigeReturnOrSpace(guess)).to.equal(true)
            }

            it("should return false if anything other than empty string") {
                let guess = "anything else"
                expect(characterValidator.isCarraigeReturnOrSpace(guess)).to.equal(false)
            }
        }

        describe("#hasOnlyLetters") {
            it("should return true if string has only letters") {
                var guess = "a"
                expect(characterValidator.hasOnlyLetters(guess)).to.equal(true)

                guess = "apple"
                expect(characterValidator.hasOnlyLetters(guess)).to.equal(true)
            }

            it("should return false if invalid because guess contains non-letter characters") {
                var guess = "1"
                expect(characterValidator.hasOnlyLetters(guess)).to.equal(false)

                guess = "!"
                expect(characterValidator.hasOnlyLetters(guess)).to.equal(false)
            }
        }
    }
}