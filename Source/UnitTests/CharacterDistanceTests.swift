import XCTest
import Nimble

func characterToUInt16(character: String) -> UInt16 {
    return Array(character.utf16)[0]
}

func distanceBetweenChars(charA: String, _ charB: String) -> Double {
    return distanceBetweenUInt16Chars(characterToUInt16(charA), and: characterToUInt16(charB))
}

class CharacterDistanceTests: XCTestCase {
    func testCharacterIsEqualToItself() {
        expect(distanceBetweenChars("a", "a")) == 0
    }
    
    func testIs1ForCharacterFarApart() {
        expect(distanceBetweenChars("a", "l")) == 1
    }

    func testLowercaseIsSimilarToUppercase() {
        expect(distanceBetweenChars("a", "A")) > 0
        expect(distanceBetweenChars("a", "A")) < distanceBetweenChars("a", "s")
    }
    
    func testBetweenLowercaseAndUppercaseIsCommutative() {
        expect(distanceBetweenChars("A", "a")) ==
               distanceBetweenChars("a", "A")
    }
    
    func testDiacriticalMarksAreSimilarToBaseCharacter() {
        expect(distanceBetweenChars("a", "ä")) > 0
        expect(distanceBetweenChars("a", "ä")) < distanceBetweenChars("a", "s")
    }
    
    func testBetweenCharsWithAndWithoutDiacriticalMarksIsCommutative() {
        expect(distanceBetweenChars("ä", "a")) ==
               distanceBetweenChars("a", "ä")
    }
}