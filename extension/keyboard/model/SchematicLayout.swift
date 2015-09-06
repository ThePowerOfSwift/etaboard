class SchematicLayout {
    static let Enter = "<cr>"
    static let Backspace = "<bs>"
    static let Space = "x3"
    static let NextSystemKeyboard = "x4"
    
    static let FromLowerToUpper = "x5"
    static let FromUppertoLower = "x6"
    static let FromLettersToSymbols = "x7"
    static let FromSymbolsToLetters = "x8"
    static let ToEmojis = "x9"

    static let Lowercase = [
        "\(FromLowerToUpper) \(Space) , . \(Backspace) \(Enter) \(ToEmojis)",
        "q w e r t z u i o p ü",
        "a s d f g h j k l ö ä",
        "' y x c v b n m - ! ?",
        "\(FromLettersToSymbols) 1 2 3 4 5 6 7 8 9 0 ß \(NextSystemKeyboard)",
    ]
    
    static let Symbols = [
        "\(FromSymbolsToLetters) \(Space) \(Backspace) \(Enter)",
        "@ & : ; + * =",
        "\" ( ) { } [ ]",
        "/ € $ < >",
    ]

    static let Emojis = [
        "\(FromSymbolsToLetters) 😊",
    ]
    
    static func uppercase(forKey key: String) -> String {
        if key == FromLowerToUpper { return FromUppertoLower }
        if isNormalKey(key) { return key.uppercaseString }
        return key
    }

    private static func isNormalKey(key: String) -> Bool {
        return count(key) == 1
    }
}