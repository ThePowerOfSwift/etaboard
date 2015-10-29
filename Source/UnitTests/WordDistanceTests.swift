import XCTest
import Nimble

class WordDistanceTests: XCTestCase {
    
    func testNonEmptyStrings() {
        expect(wordDistance("a", s2: "a")) == 0
        expect(wordDistance("a", s2: "b")) == 1
        expect(wordDistance("a",  s2: "ab")) == 1
        expect(wordDistance("ab", s2: "a")) == 1
    }

    func testEmptyStrings() {
        expect(wordDistance("", s2: "")) == 0
        expect(wordDistance("",  s2: "a")) == 1
        expect(wordDistance("a", s2: "")) == 1
    }
}
