import Foundation
import CoreGraphics


func characterToUInt16(character: Character) -> UInt16 {
    return characterToUInt16(String(character))
}
func characterToUInt16(character: String) -> UInt16 {
    return Array(character.utf16)[0]
}

let iPhone6Layout = ConcreteLayout(schematicLayout: SchematicLayout.Lowercase, size: CGSizeMake(375, 182))

let alphabet = "abcdefghijklmnopqrstuvwxyz"

var lines = [
    "// generated",
    "import Foundation",
    "func distanceBetweenUInt16Chars(keyA: UInt16, and keyB: UInt16) -> Double {",
    "if keyA == keyB { return 0 }",
    "switch (keyA) {",
]

for keyA in alphabet.characters {
    let keyALowercase = characterToUInt16(keyA)
    let keyAUppercase = characterToUInt16(String(keyA).uppercaseString)
    lines.appendContentsOf([
        "case \(keyALowercase), \(keyAUppercase):  // \(keyA)",
        "    switch (keyB) {",
        ])
    for keyB in alphabet.characters {
        let keyBLowercase = characterToUInt16(keyB)
        let keyBUppercase = characterToUInt16(String(keyB).uppercaseString)
        let distance = iPhone6Layout.normalizedDistanceBetween(String(keyA), and: String(keyB))
        if distance < 0.15 {
            lines.append("    case \(keyBLowercase), \(keyBUppercase): return \(distance)  // \(keyB)")
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
