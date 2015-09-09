class SchematicLayout {
    static let Enter = "<cr>"
    static let Backspace = "<bs>"
    static let Space = "x3"
    static let NextSystemKeyboard = "x4"
    
    static let ToUppercase = "x5"
    static let ToLowercase = "x6"
    static let ToSymbols = "x7"
    static let ToLetters = "x8"
    static let ToEmojis = "x9"

    static let Lowercase = [
        "\(ToUppercase) \(Space) , . \(Backspace) \(Enter) \(ToSymbols) \(ToEmojis)",
        "q w e r t z u i o p ü",
        "a s d f g h j k l ö ä",
        "' y x c v b n m - ! ?",
        "1 2 3 4 5 6 7 8 9 0 ß \(NextSystemKeyboard)",
    ]
    
    static let Symbols = [
        "\(ToLetters) \(Space) \(Backspace) \(Enter)",
        "@ & : ; + * =",
        "\" ( ) { } [ ]",
        "/ € $ < >",
    ]

    static let Emojis = [
        "\(ToLetters) 😊 😀 😉 😂 😞 😕",
        "☀️          😎 😛 😜 😝 😳 😠",
        "😚          😘 😴 👍 💃 🎉 🍸",
    ]
    
    static func uppercase(forKey key: String) -> String {
        if key == ToUppercase { return ToLowercase
        }
        if isNormalKey(key) { return key.uppercaseString }
        return key
    }

    private static func isNormalKey(key: String) -> Bool {
        return count(key) == 1
    }
}