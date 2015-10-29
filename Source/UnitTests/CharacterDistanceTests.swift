import XCTest
import Nimble

func characterToUInt16(character: String) -> UInt16 {
    return Array(character.utf16)[0]
}

func distanceBetweenChars(charA: String, and charB: String) -> Double {
    return distanceBetweenUInt16Chars(characterToUInt16(charA), and: characterToUInt16(charB))
}

class CharacterDistanceTests: XCTestCase {
    func testLowercaseAndUppercaseAreEquivalent() {
        expect(distanceBetweenChars("A", and: "a")) == 0
        expect(distanceBetweenChars("a", and: "A")) == 0
    }
    func testEquivalentCharsHaveSameNeighborhoods() {
        expect(distanceBetweenChars("a", and: "b")) ==
               distanceBetweenChars("a", and: "B")
        expect(distanceBetweenChars("a", and: "b")) ==
               distanceBetweenChars("A", and: "b")
    }
    func testUmlautsAndNonUmlautsAreEquivalent() {
        expect(distanceBetweenChars("a", and: "ä")) == 0
        expect(distanceBetweenChars("a", and: "Ä")) == 0
        expect(distanceBetweenChars("a", and: "á")) == 0
        expect(distanceBetweenChars("s", and: "ß")) == 0
    }
}