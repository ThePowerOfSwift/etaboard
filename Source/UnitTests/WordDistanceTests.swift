import XCTest
import Nimble

class WordDistanceTests: XCTestCase {
    
    func testNonEmptyStrings() {
        expect(wordDistance("a", "a")) == 0
        expect(wordDistance("a", "b")) == 1
        expect(wordDistance("a", "ab")) == 1
        expect(wordDistance("ab","a")) == 1
    }

    func testEmptyStrings() {
        expect(wordDistance("", "")) == 0
        expect(wordDistance("", "a")) == 1
        expect(wordDistance("a", "")) == 1
    }
    
    func testIsCrazyLargeNumberWhenCannotUndercutThreshold() {
        expect(wordDistance("a", "b", threshold: 0.5)) == Distance.max
    }

    func testUndercutsThreshold() {
        expect(wordDistance("ab", "ab", threshold: 0.1)) == 0
    }
}
