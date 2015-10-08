import Foundation
import CoreGraphics


let iPhone6Layout = ConcreteLayout(schematicLayout: SchematicLayout.Lowercase, size: CGSizeMake(375, 182))
let alphabet = "abcdefghijklmnopqrstuvwxyz"
let allEquivalentChars = [
    "a": "äáàâ",
    "o": "öø",
    "s": "ß",
    "u": "üú",
]

func characterToUInt16(character: Character) -> UInt16 {
    return characterToUInt16(String(character))
}
func characterToUInt16(character: String) -> UInt16 {
    return Array(character.utf16)[0]
}
func codesLowercaseAndUppercase(char: Character) -> [UInt16] {
    let lowercase = characterToUInt16(char)
    let uppercase = characterToUInt16(String(char).uppercaseString)
    return [lowercase, uppercase]
}
func equivalentChars(char: Character) -> [Character] {
    if let equivalentChars = allEquivalentChars[String(char)] {
        return Array(equivalentChars.characters)
    }
    return []
}
func allCodesFor(char: Character) -> String {
    let equivalents = [char] + equivalentChars(char)
    return equivalents.flatMap(codesLowercaseAndUppercase)
        .map(String.init).joinWithSeparator(",")
}



var lines = [
    "// generated",
    "import Foundation",
    "func distanceBetweenUInt16Chars(keyA: UInt16, and keyB: UInt16) -> Double {",
    "if keyA == keyB { return 0 }",
    "switch (keyA) {",
]

for keyA in alphabet.characters {
    lines.appendContentsOf([
        "case \(allCodesFor(keyA)):  // \(keyA)",
        "    switch (keyB) {",
        ])
    for keyB in alphabet.characters {
        let distance = iPhone6Layout.normalizedDistanceBetween(String(keyA), and: String(keyB))
        if distance < 0.15 {
            lines.append("    case \(allCodesFor(keyB)): return \(distance)  // \(keyB)")
        }
    }
    lines.appendContentsOf([
        "    default: return 1",
        "    }",
        ])
}


lines.appendContentsOf([
    "default: return 1",
    "}",
    "}",
    ])
print(lines.joinWithSeparator("\n"))
