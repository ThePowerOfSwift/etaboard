import XCTest
import Nimble

class LevenshteinPerformanceTests: XCTestCase {
    
    func testIsFast() {
        measureBlock {
            for _ in 1...1000 {
                levenshteinDistance(String.random(length: 4),
                    s2: String.random(length: 4))
            }
        }
    }
}
