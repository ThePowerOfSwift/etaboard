import Foundation
import CoreGraphics


let iPhone6Layout = ConcreteLayout(schematicLayout: SchematicLayout.Lowercase, size: CGSizeMake(375, 182))
let alphabet = "abcdefghijklmnopqrstuvwxyz"
let allLowercaseSimilarChars = [
    "a": "äáàâ",
    "o": "öø",
    "s": "ß",
    "u": "üú",
]

typealias CharacterCode = UInt16
let similarDistance = 0.01

func codeFor(character: Character) -> UInt16 {
    return codeFor(String(character))
}
func codeFor(character: String) -> UInt16 {
    return Array(character.utf16)[0]
}
func firstCharacter(string: String) -> Character {
    return Array(string.characters)[0]
}
func uppercase(char: Character) -> Character {
    return firstCharacter(String(char).uppercaseString)
}
func similarCharsFor(char: Character) -> [Character] {
    let uppercaseChar = [uppercase(char)]
    if let similarChars = allLowercaseSimilarChars[String(char)] {
        return uppercaseChar + Array(similarChars.characters)
    }
    return uppercaseChar
}
func similarCodesFor(char: Character) -> String {
    return similarCharsFor(char).map(codeFor)
        .map(String.init).joinWithSeparator(",")
}



var lines = [
    "// generated",
    "import Foundation",
    "func distanceBetweenUInt16Chars(codeA: UInt16, and codeB: UInt16) -> Double {",
    "if codeA == codeB { return 0 }",
    "switch (codeA) {",
]

for charA in alphabet.characters {
    lines.appendContentsOf([
        "case \(codeFor(charA)):  // \(charA)",
        "    switch (codeB) {",
        ])
    for charB in alphabet.characters {
        let distance = iPhone6Layout.normalizedDistanceBetween(String(charA), and: String(charB))
        if distance < 0.15 {
            lines.append("    case \(codeFor(charB)): return \(distance)  // \(charB)")
        }
    }
    lines.appendContentsOf([
        "    case \(similarCodesFor(charA)): return \(similarDistance)  // \(similarCharsFor(charA))",
        "    default: return 1",
        "    }",
        ])

    lines.appendContentsOf([
        "case \(similarCodesFor(charA)):  // \(similarCharsFor(charA))",
        "    switch (codeB) {",
        "    case \(codeFor(charA)): return \(similarDistance)  // \(charA)",
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
