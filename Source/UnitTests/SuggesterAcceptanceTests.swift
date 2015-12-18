import XCTest
import Nimble

class SuggesterAcceptanceTests: XCTestCase {
    let suggester = Suggester()
    
    func testStillSuggestsTheRightThingWhenMistypedAtTheDiacriticalChar() {
        suggester.addUnknownLengths(["kneifend", "übrigens"])
        expect(self.suggester.suggestCompletion(to: "ibrigens")) == "übrigens"
    }
}