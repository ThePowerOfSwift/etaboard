import XCTest
import Nimble

class SuggesterPerformanceTests: XCTestCase {
    
    func testSuggestsQuickly() {
        let suggester = createSuggester(dictionarySize: 10000, maxWordLength: 12)
        let needle = String.random(length: 6)
        measureBlock {
            suggester.suggestCompletion(to: needle)
        }
    }
    
    func testAddsNewWordsQuickly() {
        let suggester = createSuggester(dictionarySize: 10000, maxWordLength: 12)
        measureBlock {
            suggester.add([String.random()])
        }
    }

    func createSuggester(dictionarySize dictionarySize: Int, maxWordLength: Int) -> Suggester {
        let suggester = Suggester()
        let noOfWordsPerLength = dictionarySize/maxWordLength
        
        for wordLength in (1...maxWordLength) {
            let randomWords = (1...noOfWordsPerLength).map { _ in
                String.random(length: wordLength) }
            suggester.add(randomWords)
        }
        return suggester
    }    
}
