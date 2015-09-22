import XCTest
import Nimble

class StringSplitTests: XCTestCase {
    
    func testReturnsEmptyArrayForEmptyString() {
        expect("".split(".")) == []
    }
    
    func testReturnsStringUnchangedWhenNothingToSplit() {
        expect("a".split(".")) == ["a"]
    }
    
    func testExcludesSeparator() {
        expect("a.b".split(".")) == ["a", "b"]
    }
    
    func testExcludesLeadingSeparator() {
        expect(".a".split(".")) == ["a"]
    }
    
    func testExcludesTrailingSeparator() {
        expect("a.".split(".")) == ["a"]
    }
    
    func testExcludesConsecutiveSeparators() {
        expect("..".split(".")) == []
    }
}