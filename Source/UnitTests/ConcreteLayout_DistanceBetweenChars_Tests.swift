import XCTest
import Nimble


class ConcreteLayout_DistanceBetweenChars_Tests: XCTestCase {
    func testIs0ForSameChar() {
        let layout = ConcreteLayout(schematicLayout: [], size: CGSizeMake(0, 0))
        expect(layout.normalizedDistanceBetween("a", and: "a")) == 0
    }
    
    func testIncreasesWithActualDistance() {
        let layout = ConcreteLayout(schematicLayout: ["a b",
            "c d"], size: CGSizeMake(1, 1))
        expect(layout.normalizedDistanceBetween("a", and: "b"))
             < layout.normalizedDistanceBetween("a", and: "d")
    }
    
    func testIsCappedTo1() {
        let layout = ConcreteLayout(schematicLayout: ["a b",
            "c d"], size: CGSizeMake(100, 100))
        expect(layout.normalizedDistanceBetween("a", and: "d")) < 1
    }
    
    func testIs1ForUnknownCharacters() {
        let layout = ConcreteLayout(schematicLayout: ["a"], size: CGSizeMake(0, 0))
        expect(layout.normalizedDistanceBetween("a", and: "b")) == 1
        expect(layout.normalizedDistanceBetween("b", and: "a")) == 1
    }
}
