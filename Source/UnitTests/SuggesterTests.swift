import XCTest
import Nimble

class SuggesterTests: XCTestCase {
    
    func testDoesNotCrashWithAnEmptyDictionary() {
        let suggester = Suggester()
        suggester.words = []
        suggester.suggestCompletion(to: "")
    }
}
