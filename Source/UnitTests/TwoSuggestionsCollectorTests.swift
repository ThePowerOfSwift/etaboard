import XCTest
import Nimble

class TwoSuggestionsCollectorTests: XCTestCase {
    private let collector = TwoSuggestionsCollector()
    
    func testCollectsNoSuggestionsWhenNoneAdded() {
        expect(self.collector.getSuggestions()).to(beEmpty())
    }
    
    func testCollectsOneSuggestionWhenOneAdded() {
        collector.addSuggestion("foo", distance: 0)
        expect(self.collector.getSuggestions()) == ["foo"]
    }
    
    func testCollectsSuggestionsSortedByShortestDistanceFirst() {
        collector.addSuggestion("foo", distance: 0)
        collector.addSuggestion("bar", distance: -1)
        expect(self.collector.getSuggestions()) == ["bar", "foo"]
    }

    func testLimitsNumberOfSuggestionsToTwo() {
        collector.addSuggestion("foo", distance: 0)
        collector.addSuggestion("bar", distance: 0)
        collector.addSuggestion("baz", distance: 0)
        expect(self.collector.getSuggestions()).to(haveCount(2))
    }
}