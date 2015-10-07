import Foundation
import CoreGraphics


func characterToUInt16(character: Character) -> UInt16 {
    return Array(String(character).utf16)[0]
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
    lines.appendContentsOf([
        "case \(characterToUInt16(keyA)):  // \(keyA)",
        "    switch (keyB) {",
        ])
    for keyB in alphabet.characters {
        let distance = iPhone6Layout.normalizedDistanceBetween(String(keyA), and: String(keyB))
        if distance < 0.15 {
            lines.append("    case \(characterToUInt16(keyB)): return \(distance)  // \(keyB)")
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
