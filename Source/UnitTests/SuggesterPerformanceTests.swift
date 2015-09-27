import XCTest
import Nimble

class SuggesterPerformanceTests: XCTestCase {
    
    func testIsFast() {
        let suggester = createSuggester(dictionarySize: 10000, maxWordLength: 12)
        let needle = String.random(length: 6)
        measureBlock {
            suggester.suggestCompletion(to: needle)
        }
    }

    func createSuggester(dictionarySize dictionarySize: Int, maxWordLength: Int) -> Suggester {
        let suggester = Suggester()
        let noOfWordsPerLength = dictionarySize/maxWordLength
        
        var dictionary = [String]()
        for wordLength in (1...maxWordLength) {
            let randomWords = (1...noOfWordsPerLength).map { _ in String.random(length: wordLength) }
            dictionary.appendContentsOf(randomWords)
        }
        expect(dictionary.count) >= dictionarySize - maxWordLength
        expect(dictionary.count) <= dictionarySize + maxWordLength

        
        suggester.words = dictionary
        return suggester
    }
    
}
