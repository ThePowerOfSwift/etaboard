import XCTest
import Nimble

class SuggesterTests: XCTestCase {
    
    func testDoesNotCrashWithAnEmptyDictionary() {
        let suggester = Suggester()
        suggester.words = []
        suggester.suggestCompletion(to: "")
    }
    
    func testSuggestsTheWordItselfIfItsInTheDictionary() {
        let suggester = Suggester()
        suggester.words = ["foo", "bar"]
        expect(suggester.suggestCompletion(to: "foo")) == "foo"
    }
}
