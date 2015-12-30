import XCTest
import Nimble

class CharacterDistanceTests: XCTestCase {
    func testIs0ToItself() {
        expect(self.distanceBetweenChars("a", "a")) == 0
    }
    
    func testIs1ToCharFarApart() {
        expect(self.distanceBetweenChars("a", "l")) == 1
    }
    
    func testIsInBetweenToNeighboringChar() {
        expect(self.distanceBetweenChars("a", "s")) > 0
        expect(self.distanceBetweenChars("a", "s")) < 1
    }
    
    func testIsCommutative() {
        expect(self.distanceBetweenChars("A", "a")) ==
                    distanceBetweenChars("a", "A")
    }
    
    func testUppercaseAndDiacriticalVariantsArePartOfTheFamily() {
        // the six basic relations
        
        expect("ä").to(beSimilarTo("a"))
        expect("Ä").to(beSimilarTo("a"))
        expect("A").to(beSimilarTo("a"))
        
        expect("A").to(beSimilarTo("Ä"))
        expect("A").to(beSimilarTo("ä"))
        
        expect("Ä").to(beSimilarTo("ä"))
    }

    func testCharFamilyRemainsCloseToNeighboringLowercaseChar() {
        let baseDistance = distanceBetweenChars("a", "s")
        expect(self.distanceBetweenChars("A", "s")) ≈
                    distanceBetweenChars("A", "a") + baseDistance

        expect(self.distanceBetweenChars("ä", "s")) ≈
                    distanceBetweenChars("ä", "a") + baseDistance
        
        expect(self.distanceBetweenChars("Ä", "s")) ≈
                    distanceBetweenChars("Ä", "a") + baseDistance
    }

    func testCharFamilyRemainsCloseToNeighboringUppercaseChar() {
        let baseDistance = distanceBetweenChars("a", "s")
        
        // a–S follows by symmetry
        
        expect(self.distanceBetweenChars("ä", "S")) ≈
                    distanceBetweenChars("ä", "A") + baseDistance
        
        expect(self.distanceBetweenChars("Ä", "S")) ≈
                    distanceBetweenChars("Ä", "A") + baseDistance
    }

    func testUppercaseIsCloserThanWithDiacriticalMark() {
        expect(self.distanceBetweenChars("a", "A")) <
                    distanceBetweenChars("a", "ä")
    }
    
    func testUppercaseVariantsOfBaseCharactersHaveSameDistanceAsLowercaseVariants() {
        expect(self.distanceBetweenChars("K", "L")) ==
                    distanceBetweenChars("k", "l")
    }

    func testUppercaseVariantsOfDiacriticalCharactersHaveSameDistanceAsLowercaseVariants() {
        expect(self.distanceBetweenChars("A", "Ä")) ==
                    distanceBetweenChars("a", "ä")
    }
    
}


extension CharacterDistanceTests {
    func distanceBetweenChars(charA: Character, _ charB: Character) -> Distance {
        return distanceBetweenUInt16Chars(charA.code(), and: charB.code())
    }

    private func formatDistance(distance: Distance) -> String {
        return String(format: "%.3f", distance)
    }

    func beSimilarTo(expected: Character) -> MatcherFunc<String> {
        let limit = distanceBetweenChars("a", "s")
        
        return MatcherFunc { actualExpression, failureMessage in
            guard let actual = try actualExpression.evaluate() else {
                return false
            }
            
            let distance = self.distanceBetweenChars(expected, actual.first())
            failureMessage.postfixMessage = "be closer than <\(self.formatDistance(limit))>"
            failureMessage.postfixActual = " (distance: \(self.formatDistance(distance)))"
            return distance > 0 && distance < limit
        }
    }
}
