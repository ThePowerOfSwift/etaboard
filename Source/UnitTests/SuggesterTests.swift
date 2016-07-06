import XCTest
import Nimble

class SuggesterTests: XCTestCase {
    let suggester = Suggester()
    
    func testDoesNotCrashWithAnEmptyDictionary() {
        let collector = OneSuggestionCollector()
        suggester.collectSuggestionsFor("", into: collector)
    }

    func testSuggestsTheWordItselfIfItsInTheDictionary() {
        suggester.addSameLength(["foo", "bar"])
        expect(self.getSuggestionFor("foo")) == "foo"
    }
    
    func testAddsNewWordsOfSameLengthWhenLengthKnown() {
        suggester.addSameLength(["foo"])
        suggester.addSameLength(["bar"])
        expect(self.getSuggestionFor("bar")) == "bar"
    }
    
    func testAddsNewWordsOfSameLengthWhenLengthUnknown() {
        suggester.addSameLength(["foo"])
        suggester.addUnknownLengths(["bar"])
        expect(self.getSuggestionFor("bar")) == "bar"
    }
    
    func testPreservesEarlierWordsWhenAddingNewWordsOfSameLength() {
        suggester.addSameLength(["foo"])
        suggester.addSameLength(["bar"])
        expect(self.getSuggestionFor("foo")) == "foo"
    }
    
    func testPreservesEarlierWordsWhenAddingNewWordsOfUnknownLength() {
        suggester.addSameLength(["foo"])
        suggester.addUnknownLengths(["bar"])
        expect(self.getSuggestionFor("foo")) == "foo"
    }
    
    func testCapitalizesSuggestionIfCurrentWordContainsCapitalLetter() {
        suggester.addSameLength(["foo"])
        expect(self.getSuggestionFor("foO")) == "Foo"
    }
    
    private func getSuggestionFor(word: String) -> String? {
        let collector = OneSuggestionCollector()
        suggester.collectSuggestionsFor(word, into: collector)
        return collector.getBestSuggestion()
    }
}


private class OneSuggestionCollector: SuggestionsCollector {
    private var bestDistance = Distance.max
    private var bestSuggestion = ""
    
    var boundary: Distance { return bestDistance }
    
    func addSuggestion(suggestion: String, distance: Distance) {
        if distance < bestDistance {
            bestDistance = distance
            bestSuggestion = suggestion
        }
    }
    
    func mapSuggestions(functor: String -> String) {
        bestSuggestion = functor(bestSuggestion)
    }
    
    func getBestSuggestion() -> String {
        return bestSuggestion
    }
}
