import XCTest
import Nimble

class LevenshteinDistanceTests: XCTestCase {
    
    func test() {
        expect(levenshteinDistance("a", "a")) == 0
        expect(levenshteinDistance("a", "b")) == 1
        expect(levenshteinDistance("", "a")) == 1
        expect(levenshteinDistance("a", "")) == 1
    }
}
