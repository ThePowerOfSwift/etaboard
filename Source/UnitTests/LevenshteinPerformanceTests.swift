import XCTest
import Nimble

class LevenshteinPerformanceTests: XCTestCase {
    
    func testIsFast() {
        measureBlock {
            for _ in 1...100 {
                levenshteinDistance(self.generateRandomString(length: 4),
                    s2: self.generateRandomString(length: 4))
            }
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
