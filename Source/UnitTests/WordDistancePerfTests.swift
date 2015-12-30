import XCTest
import Nimble

class WordDistancePerformanceTests: XCTestCase {
    
    func testIsFast() {
        measureBlock {
            for _ in 1...1000 {
                wordDistance(String.random(length: 4), String.random(length: 4))
            }
        }
    }
}
