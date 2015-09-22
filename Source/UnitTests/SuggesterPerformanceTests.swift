import XCTest
import Nimble

class SuggesterPerformanceTests: XCTestCase {
    
    func testIsFast() {
        let suggester = createSuggester(dictionarySize: 5000, maxWordLength: 12)
        let needle = randomString(length: 6)
        measureBlock {
            suggester.suggestCompletion(to: needle)
        }
    }

    func randomInt(max ceiling: Int) -> Int {
        return Int(arc4random_uniform(UInt32(ceiling+1)))
    }

    func randomInt(min floor: Int, max ceiling: Int) -> Int {
        return randomInt(max: ceiling - floor) + floor
    }

    func randomString() -> String {
        return randomString(length: randomInt(min: 1, max: 10))
    }

    func randomString(length length:Int) -> String {
        let alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var s = ""
        for _ in (1...length) {
            let randomIndexInAlphabet = randomInt(max: alphabet.characters.count-1)
            s.append(alphabet[alphabet.startIndex.advancedBy(randomIndexInAlphabet)])
        }
        return s
    }
    
    func createSuggester(dictionarySize dictionarySize: Int, maxWordLength: Int) -> Suggester {
        let suggester = Suggester()
        let noOfWordsPerLength = dictionarySize/maxWordLength
        
        var dictionary = [String]()
        for wordLength in (1...maxWordLength) {
            let randomWords = (1...noOfWordsPerLength).map { _ in randomString(length: wordLength) }
            dictionary.appendContentsOf(randomWords)
        }
        expect(dictionary.count) >= dictionarySize - maxWordLength
        expect(dictionary.count) <= dictionarySize + maxWordLength

        
        suggester.words = dictionary
        return suggester
    }
    
}
