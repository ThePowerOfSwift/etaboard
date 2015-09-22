import XCTest
import Nimble

class LevenshteinDistanceTests: XCTestCase {
    
    func test() {
        expect(levenshteinDistance("a", s2: "a")) == 0
        expect(levenshteinDistance("a", s2: "b")) == 1
        expect(levenshteinDistance("",  s2: "a")) == 1
        expect(levenshteinDistance("a", s2: "")) == 1
    }
}
