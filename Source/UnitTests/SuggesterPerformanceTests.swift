import XCTest
import Nimble

class SuggesterPerformanceTests: XCTestCase {
    
    func testIsFast() {
        let suggester = createSuggester(dictionarySize: 100)
        measureBlock {
            suggester.suggestCompletion(to: generateRandomString(length: 3))
        }
    }

    func generateRandomString(length length:Int) -> String {
        let alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var s = ""
        for _ in (1...length) {
            let randomInt = Int(arc4random_uniform(UInt32(alphabet.characters.count)))
            s.append(alphabet[alphabet.startIndex.advancedBy(randomInt)])
        }
        return s
    }
    
    func createSuggester(dictionarySize dictionarySize: Int) -> Suggester {
        let suggester = Suggester()
        let randomDictionary = (1...dictionarySize).map { _ in generateRandomString(length: 10) }
        suggester.words = randomDictionary
        expect(suggester.words.count) == dictionarySize
        return suggester
    }
    
}
