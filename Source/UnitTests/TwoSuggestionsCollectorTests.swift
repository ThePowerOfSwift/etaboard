import XCTest
import Nimble

class TwoSuggestionsCollectorTests: XCTestCase {
    private let collector = TwoSuggestionsCollector()
    
    func testReturnsTwoEmptySuggestionsWhenNoneAdded() {
        expect(self.collector.getSuggestions()) == ["", ""]
    }
    
    func testCollectsOneSuggestion() {
        collector.addSuggestion("foo")
        expect(self.collector.getSuggestions()) == ["foo", ""]
    }

    func testCollectsTwoSuggestions() {
        collector.addSuggestion("foo")
        collector.addSuggestion("bar")
        expect(self.collector.getSuggestions()) == ["foo", "bar"]
    }

    func testCollectsSuggestionsSortedByShortestDistanceAscending() {
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