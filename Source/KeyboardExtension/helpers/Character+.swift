typealias CharacterCode = UInt16

extension Character {
    func uppercase() -> Character {
        return String(self).uppercaseString.first()
    }
    
    func utf16() -> UInt16 {
        return Array(String(self).utf16)[0]
    }
    
    func code() -> CharacterCode {
        return utf16()
    }
}
