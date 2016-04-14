public class CharacterValidator {
    public init() {}

    public func isCarraigeReturnOrSpace(word: String) -> Bool {
        return word == "" || word == " "
    }
    
    public func hasOnlyLetters(word: String) -> Bool {
        for character in word.characters {
            if !(character >= "a" && character <= "z") && !(character >= "A" && character <= "Z") && !(character == " ") {
                return false
            }
        }
        return true
    }
}