import XCTest
import Nimble

class LevenshteinDistanceTests: XCTestCase {
    
    func testNonEmptyStrings() {
        expect(levenshteinDistance("a", s2: "a")) == 0
        expect(levenshteinDistance("a", s2: "b")) == 1
        expect(levenshteinDistance("a",  s2: "ab")) == 1
        expect(levenshteinDistance("ab", s2: "a")) == 1
    }

    func testEmptyStrings() {
        expect(levenshteinDistance("", s2: "")) == 0
        expect(levenshteinDistance("",  s2: "a")) == 1
        expect(levenshteinDistance("a", s2: "")) == 1
    }
}
