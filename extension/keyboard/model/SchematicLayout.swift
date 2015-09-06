class SchematicLayout {
    static let Enter = "<cr>"
    static let Backspace = "<bs>"
    static let Space = "x3"
    static let NextSystemKeyboard = "x4"
    
    static let LettersPageUppercase = "x5"
    static let LettersPageLowercase = "x6"
    static let SymbolsPage = "x7"
    static let LettersPageOnSymbolsPage = "x8"

    static let rowsLowercase = [
        "\(LettersPageUppercase) \(Space) , . \(Backspace) \(Enter)",
        "q w e r t z u i o p ü",
        "a s d f g h j k l ö ä",
        "' y x c v b n m - ! ?",
        "\(SymbolsPage) 1 2 3 4 5 6 7 8 9 0 ß \(NextSystemKeyboard)",
    ]
    
    static let rowsSymbolsPage = [
        "\(LettersPageOnSymbolsPage) \(Space) \(Backspace) \(Enter)",
        "@ + * # : ;",
    ]

    static func uppercase(forKey key: String) -> String {
        if key == LettersPageUppercase { return LettersPageLowercase }
        if isNormalKey(key) { return key.uppercaseString }
        return key
    }

    private static func isNormalKey(key: String) -> Bool {
        return count(key) == 1
    }
}