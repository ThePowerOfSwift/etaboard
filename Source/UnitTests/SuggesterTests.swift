import XCTest
import Nimble

class SuggesterTests: XCTestCase {
    let suggester = Suggester()
    
    func testDoesNotCrashWithAnEmptyDictionary() {
        suggester.suggestCompletion(to: "")
    }
    
    func testSuggestsTheWordItselfIfItsInTheDictionary() {
        suggester.addSameLength(["foo", "bar"])
        expect(self.suggester.suggestCompletion(to: "foo")) == "foo"
    }
    
    func testCapitalizesSuggestionIfCurrentWordContainsCapitalLetter() {
        suggester.addSameLength(["foo"])
        expect(self.suggester.suggestCompletion(to: "foO")) == "Foo"
    }
    
    func testAddsNewWordsOfSameLengthWhenLengthKnown() {
        suggester.addSameLength(["foo"])
        suggester.addSameLength(["bar"])
        expect(self.suggester.suggestCompletion(to: "bar")) == "bar"
    }

    func testAddsNewWordsOfSameLengthWhenLengthUnknown() {
        suggester.addSameLength(["foo"])
        suggester.addUnknownLengths(["bar"])
        expect(self.suggester.suggestCompletion(to: "bar")) == "bar"
    }

    func testPreservesEarlierWordsWhenAddingNewWordsOfSameLength() {
        suggester.addSameLength(["foo"])
        suggester.addSameLength(["bar"])
        expect(self.suggester.suggestCompletion(to: "foo")) == "foo"
    }

    func testPreservesEarlierWordsWhenAddingNewWordsOfUnknownLength() {
        suggester.addSameLength(["foo"])
        suggester.addUnknownLengths(["bar"])
        expect(self.suggester.suggestCompletion(to: "foo")) == "foo"
    }
}
