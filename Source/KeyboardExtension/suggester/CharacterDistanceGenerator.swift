import Foundation
import CoreGraphics


let iPhone6Layout = ConcreteLayout(schematicLayout: SchematicLayout.Lowercase, size: CGSizeMake(375, 182))
func distanceBetween(charA: Character, and charB: Character) -> Distance {
    return iPhone6Layout.normalizedDistanceBetween(String(charA), and: String(charB))
}

let alphabet = "abcdefghijklmnopqrstuvwxyz"
let allLowercaseSimilarChars = [
    "a": "äáàâ",
    "o": "öø",
    "s": "ß",
    "u": "üú",
]

let uppercaseDistance = 0.01
let similarDistance = 0.02

func similarCharsFor(char: Character) -> [Character] {
    if let similarChars = allLowercaseSimilarChars[String(char)] {
        return Array(similarChars.characters)
    }
    return []
}
func codes(chars: [Character]) -> String {
    return chars.map { $0.code() }
        .map(String.init).joinWithSeparator(",")
}



var lines = [
    "// generated",
    "import Foundation",
    "func distanceBetweenUInt16Chars(codeA: UInt16, and codeB: UInt16) -> Distance {",
    "if codeA == codeB { return 0 }",
    "switch (codeA) {",
]

for charA in alphabet.characters {
    lines.appendContentsOf([
        "case \(charA.code()):  // \(charA)",
        "    switch (codeB) {",
        ])
    for charB in alphabet.characters {
        let distance = distanceBetween(charA, and: charB)
        if distance < 0.15 {
            lines.append("    case \(charB.code()): return \(distance)  // \(charB)")
        }
    }
    lines.append(
        "    case \(charA.uppercase().code()): return \(uppercaseDistance)  // \(charA.uppercase()))"
        )
    let similarChars = similarCharsFor(charA)
    if !similarChars.isEmpty {
        lines.append(
            "    case \(codes(similarChars)): return \(similarDistance)  // \(similarChars)"
            )
    }
    lines.appendContentsOf([
        "    default: return 1",
        "    }",
        ])

    lines.appendContentsOf([
        "case \(charA.uppercase().code()):  // \(charA.uppercase())",
        "    switch (codeB) {",
        "    case \(charA.code()): return \(uppercaseDistance)  // \(charA)",
        "    default: return 1",
        "    }",
        ])
    if !similarChars.isEmpty {
        lines.appendContentsOf([
            "case \(codes(similarChars)):  // \(similarChars)",
            "    switch (codeB) {",
            "    case \(charA.code()): return \(similarDistance)  // \(charA)",
            "    default: return 1",
            "    }",
            ])
    }
}

lines.appendContentsOf([
    "default: return 1",
    "}",
    "}",
    ])
print(lines.joinWithSeparator("\n"))
