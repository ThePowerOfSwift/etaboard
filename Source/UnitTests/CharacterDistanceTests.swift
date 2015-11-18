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
    
    func testUppercaseIsCloserThanWithDiacriticalMark() {
        expect(distanceBetweenChars("a", "A")) <
               distanceBetweenChars("a", "ä")
    }
}


func distanceBetweenChars(charA: Character, _ charB: Character) -> Distance {
    return distanceBetweenUInt16Chars(charA.code(), and: charB.code())
}

func beSimilarTo(expected: Character) -> MatcherFunc<String> {
    return MatcherFunc { actualExpression, failureMessage in
        guard let actual = try actualExpression.evaluate() else {
            return false
        }
        
        let distance = distanceBetweenChars(expected, actual.first())
        failureMessage.postfixMessage = "be similar to <\(expected)>"
        failureMessage.postfixActual = " (distance: \(String(distance)))"
        return distance > 0 &&
            distance < distanceBetweenChars("a", "s")
    }
}
