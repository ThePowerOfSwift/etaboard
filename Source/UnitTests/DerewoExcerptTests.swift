import XCTest
import Nimble

class DerewoImporterTests: XCTestCase {
    
    func testDiscardsComments() {
        expect(createDerewoExcerpt(["#foo"])) == []
    }
    
    func testDropsFrequencyClass() {
        expect(createDerewoExcerpt(["foo 0"])) == ["foo"]
    }
    
    func testDropsFrequencyClassAndWordType() {
        expect(createDerewoExcerpt(["foo 0 BAR"])) == ["foo"]
    }
    
    func testSplitsMultipleWords() {
        expect(createDerewoExcerpt(["foo,bar"])) == ["foo", "bar"]
    }

    func testExpandsShortNotationForMultipleWords() {
        expect(createDerewoExcerpt(["foo(bar,baz)"])) == ["foobar", "foobaz"]
    }
    
    func testDropsWordsNotWithinGivenFrequencyClass() {
        expect(createDerewoExcerpt(["foo 1"], maxFrequencyClass: 0)) == []
    }
}
