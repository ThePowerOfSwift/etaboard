import XCTest
import Nimble

class SuggesterTests: XCTestCase {
    let suggester = Suggester()
    
    func testDoesNotCrashWithAnEmptyDictionary() {
        suggester.suggestCompletion(to: "")
    }
    
    func testSuggestsTheWordItselfIfItsInTheDictionary() {
        suggester.add(["foo", "bar"])
        expect(self.suggester.suggestCompletion(to: "foo")) == "foo"
    }
    
    func testCapitalizesSuggestionIfCurrentWordContainsCapitalLetter() {
        suggester.add(["foo"])
        expect(self.suggester.suggestCompletion(to: "foO")) == "Foo"
    }
    
    func testPreservesEarlierWordsWhenAddingNewWords() {
        suggester.add(["foo"])
        suggester.add(["bar"])
        expect(self.suggester.suggestCompletion(to: "foo")) == "foo"
    }
}
