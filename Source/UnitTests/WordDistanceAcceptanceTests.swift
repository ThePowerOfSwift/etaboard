import XCTest
import Nimble

class WordDistanceAcceptanceTests: XCTestCase {
    func testIsSimilarWhenMistypedAtTheDiacriticalChar() {
        expect("ibrigens").to(beCloserTo("übrigens", thanTo: "kneifend"))
    }
    
    func testIsSmallerForSimplerMistakes() {
        expect("Kust").to(beCloserTo("Lust", thanTo: "küßt"))
    }
    
    func testIsSmallerForCapitalizationMistakesThanForDiacriticalOnes() {
        expect("Grose").to(beCloserTo("große", thanTo: "Größe"))
    }
    
    func testIsSmallerForCapitalizationMistakesThanForTypos() {
        expect("bjld").to(beCloserTo("Bild", thanTo: "bold"))
    }
}

extension WordDistanceAcceptanceTests {
    private func formatDistance(distance: Distance) -> String {
        return String(format: "%.3f", distance)
    }

    func beCloserTo(closerWord: String, thanTo moreDistantWord: String) -> MatcherFunc<String> {
        return MatcherFunc { actualExpression, failureMessage in
            guard let referenceWord = try actualExpression.evaluate() else {
                return false
            }
            
            let distanceToCloserWord = wordDistance(referenceWord, closerWord)
            let distanceToMoreDistantWord = wordDistance(referenceWord, moreDistantWord)
            
            failureMessage.postfixMessage = "be closer to '\(closerWord)' (distance: \(self.formatDistance(distanceToCloserWord)))"
            failureMessage.postfixActual = ", distance to '\(moreDistantWord)': \(self.formatDistance(distanceToMoreDistantWord))"
            return distanceToCloserWord < distanceToMoreDistantWord
        }
    }
}