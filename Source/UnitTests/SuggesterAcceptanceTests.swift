import XCTest
import Nimble

class WordDistanceAcceptanceTests: XCTestCase {
    let suggester = Suggester()
    
    func testStillSuggestsTheRightThingWhenMistypedAtTheDiacriticalChar() {
        suggester.addUnknownLengths(["kneifend", "übrigens"])
        expect(self.suggester.suggestCompletion(to: "ibrigens")) == "übrigens"
    }
    
    func testPrefersSimplerMistakes() {
        suggester.addUnknownLengths(["küßt", "Lust"])
        expect(self.suggester.suggestCompletion(to: "Kust")) == "Lust"
    }
    
    func testPrefersCapitalizationMistakesToDiacriticalOnes() {
        suggester.addUnknownLengths(["Größe", "große"])
        expect(self.suggester.suggestCompletion(to: "Grose")) == "Große"
    }
    
    func testUndervalueCapitalizationDifferencesComparedToKeyDistances() {
        suggester.addUnknownLengths(["bold", "Bild"])
        expect(self.suggester.suggestCompletion(to: "bjld")) == "Bild"
    }
}