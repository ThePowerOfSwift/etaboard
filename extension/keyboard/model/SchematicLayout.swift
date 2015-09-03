class SchematicLayout {
    static let Enter = "<cr>"
    static let Backspace = "<bs>"
    static let Space = "x3"
    static let NextKeyboard = "x4"
    static let Shift = "x5"

    static let rowsLowercase = [
        "\(Shift) \(Space) , . \(Backspace) \(Enter) \(NextKeyboard)",
        "q w e r t z u i o p ü",
        "a s d f g h j k l ö ä",
        "' y x c v b n m - ! ?",
        "1 2 3 4 5 6 7 8 9 0 ß",
    ]

    static func uppercase(forKey key: String) -> String {
        if isNormalKey(key) { return key.uppercaseString }
        return key
    }

    private static func isNormalKey(key: String) -> Bool {
        return count(key) == 1
    }
}