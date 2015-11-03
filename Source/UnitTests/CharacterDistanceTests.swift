import XCTest
import Nimble

class CharacterDistanceTests: XCTestCase {
    func testCharacterIsEqualToItself() {
        expect(distanceBetweenChars("a", "a")) == 0
    }
    
    func testIs1ForCharacterFarApart() {
        expect(distanceBetweenChars("a", "l")) == 1
    }

    func testLowercaseIsSimilarToUppercase() {
        expect("A").to(beSimilarTo("a"))
    }

    func testBetweenLowercaseAndUppercaseIsCommutative() {
        expect(distanceBetweenChars("A", "a")) ==
               distanceBetweenChars("a", "A")
    }
    
    func testDiacriticalMarksAreSimilarToBaseCharacter() {
        expect("ä").to(beSimilarTo("a"))
    }
    
    func testBetweenCharsWithAndWithoutDiacriticalMarksIsCommutative() {
        expect(distanceBetweenChars("ä", "a")) ==
               distanceBetweenChars("a", "ä")
    }
}


func characterToUInt16(character: String) -> UInt16 {
    return Array(character.utf16)[0]
}

func distanceBetweenChars(charA: String, _ charB: String) -> Double {
    return distanceBetweenUInt16Chars(characterToUInt16(charA), and: characterToUInt16(charB))
}

func beSimilarTo(expected: String) -> MatcherFunc<String> {
    return MatcherFunc { actualExpression, failureMessage in
        guard let actual = try actualExpression.evaluate() else {
            return false
        }
        
        let distance = distanceBetweenChars(expected, actual)
        failureMessage.postfixMessage = "be similar to <\(expected)>"
        failureMessage.postfixActual = " (distance: \(String(distance)))"
        return distance > 0 &&
            distance < distanceBetweenChars("a", "s")
    }
}
