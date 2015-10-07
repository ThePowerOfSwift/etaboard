import XCTest
import Nimble

func characterToUInt16(character: String) -> UInt16 {
    return Array(character.utf16)[0]
}

func distanceBetweenChars(charA: String, and charB: String) -> Double {
    return distanceBetweenUInt16Chars(characterToUInt16(charA), and: characterToUInt16(charB))
}

class KeyDistanceTests: XCTestCase {
    func testConsidersLowercaseAndUppercaseEqual() {
        expect(distanceBetweenChars("A", and: "a")) == 0
        expect(distanceBetweenChars("a", and: "A")) == 0
    }
    func testLowercaseAndUppercaseHaveSameNeighborhoods() {
        expect(distanceBetweenChars("a", and: "b")) ==
               distanceBetweenChars("a", and: "B")
        expect(distanceBetweenChars("a", and: "b")) ==
               distanceBetweenChars("A", and: "b")
    }
}