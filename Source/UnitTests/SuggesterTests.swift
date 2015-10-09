import XCTest
import Nimble

class SuggesterTests: XCTestCase {
    let suggester = Suggester()
    
    func testDoesNotCrashWithAnEmptyDictionary() {
        suggester.words = []
        suggester.suggestCompletion(to: "")
    }
    
    func testSuggestsTheWordItselfIfItsInTheDictionary() {
        suggester.words = ["foo", "bar"]
        expect(self.suggester.suggestCompletion(to: "foo")) == "foo"
    }
    
    func testCapitalizesSuggestionIfCurrentWordContainsCapitalLetter() {
        suggester.words = ["foo"]
        expect(self.suggester.suggestCompletion(to: "foO")) == "Foo"
    }
}
