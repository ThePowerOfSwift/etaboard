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
    
    func testAddsNewWordsOfVaryingLengthsQuickly() {
        let suggester = createSuggester(dictionarySize: 10000, maxWordLength: 12)
        let randomWords = generateRandomStrings(500)
        measureBlock {
            suggester.add(randomWords)
        }
    }
    
    func testAddsNewWordsOfSameLengthQuickly() {
        let suggester = createSuggester(dictionarySize: 10000, maxWordLength: 12)
        let randomWords = generateRandomStrings(10000, length: 10)
        measureBlock {
            suggester.add(randomWords, length: 10)
        }
    }

    private func createSuggester(dictionarySize dictionarySize: Int, maxWordLength: Int) -> Suggester {
        let suggester = Suggester()
        let noOfWordsPerLength = dictionarySize/maxWordLength
        
        for wordLength in (1...maxWordLength) {
            suggester.add(generateRandomStrings(noOfWordsPerLength, length: wordLength))
        }
        return suggester
    }
    
    private func generateRandomStrings(numberOfStrings: Int, length: Int? = nil) -> [String] {
        var generator: Int -> String = { _ in String.random() }
        if let length = length {
            generator = { _ in String.random(length: length) }
        }
        return (1...numberOfStrings).map(generator)
    }
}
