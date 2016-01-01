import XCTest
import Nimble

class TwoSuggestionsCollectorTests: XCTestCase {
    private let collector = TwoSuggestionsCollector()
    
    func testCollectsNoSuggestionsWhenNoneAdded() {
        expect(self.collector.getSuggestions()).to(beEmpty())
    }
    
    func testCollectsOneSuggestionWhenOneAdded() {
        collector.addSuggestion("foo")
        expect(self.collector.getSuggestions()) == ["foo"]
    }
    
    func testCollectsSuggestionsSortedByShortestDistanceFirst() {
        collector.addSuggestion("foo", distance: 0)
        collector.addSuggestion("bar", distance: -1)
        expect(self.collector.getSuggestions()) == ["bar", "foo"]
    }

    func testLimitsNumberOfSuggestionsToTwo() {
        collector.addSuggestion("foo")
        collector.addSuggestion("bar")
        collector.addSuggestion("baz")
        expect(self.collector.getSuggestions()).to(haveCount(2))
    }
    
    func testAppliesTransformToAllSuggestions() {
        collector.addSuggestion("foo")
        collector.addSuggestion("bar")
        collector.mapSuggestions { $0.capitalizedString }
        expect(self.collector.getSuggestions()) == ["Foo", "Bar"]
    }
}