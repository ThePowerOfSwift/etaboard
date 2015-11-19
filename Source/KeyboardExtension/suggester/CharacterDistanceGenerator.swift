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

typealias Distances = [Character: [Character: Distance]]
var distances: Distances = [:]
func addDistance(charA: Character, _ charB: Character, _ distance: Distance) {
    if charA.code() > charB.code() { return addDistance(charB, charA, distance) }

    if let _ = distances[charA] {
        distances[charA]![charB] = distance
    } else {
        distances[charA] = [charB: distance]
    }
}


for charA in alphabet.characters {
    for charB in alphabet.characters {
        let distance = distanceBetween(charA, and: charB)
        if distance < 0.15 { addDistance(charA, charB, distance) }
    }
    addDistance(charA, charA.uppercase(), uppercaseDistance)
    for similarChar in similarCharsFor(charA) {
        addDistance(charA, similarChar, similarDistance)
    }
}


var lines = [
    "// generated",
    "import Foundation",
    "func distanceBetweenUInt16Chars(codeA: CharacterCode, and codeB: CharacterCode) -> Distance {",
    "if codeA == codeB { return 0 }",
    "if codeA > codeB { return distanceBetweenUInt16Chars(codeB, and: codeA) }",
    "switch (codeA) {",
]

for (charA, distancesForCharA) in distances {
    lines.appendContentsOf([
        "case \(charA.code()):  // \(charA)",
        "    switch (codeB) {",
        ])
    for (charB, distance) in distancesForCharA {
        lines.append("    case \(charB.code()): return \(distance)  // \(charB)")
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
