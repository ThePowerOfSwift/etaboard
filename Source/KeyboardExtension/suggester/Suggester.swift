import Foundation

class Suggester {
    private var wordsByLength = [Int: [String]]()
    
    var size: Int {
        get {
            return wordsByLength.values.map { $0.count } .reduce(0, combine: +)
        }
    }
    
    func addUnknownLengths(newWords: [String]) {
        let newWordsByLength = newWords.groupBy { $0.characters.count }
        for (_, newWordsForLength) in newWordsByLength {
            addSameLength(newWordsForLength)
        }
    }
    
    func addSameLength(newWordsForLength: [String]) {
        if let length = newWordsForLength.first?.characters.count {
            if let existingWordsForLength = wordsByLength[length] {
                wordsByLength[length] = existingWordsForLength + newWordsForLength
            } else {
                wordsByLength[length] = newWordsForLength
            }
        }
    }
}

extension Suggester {
    func collectSuggestionsFor(currentContext: String?, into collector: SuggestionsCollector) {
        NSLog("asked for suggestion for: \(currentContext)")
        guard let currentWord = currentContext else { return }
        
        collectSuggestionsWithDistancesFor(currentWord, into: collector)
        if (containsCapitalLetter(currentWord)) {
            return collector.mapSuggestions(capitalize)
        }
    }
    
    private func collectSuggestionsWithDistancesFor(word: String,
        into collector: SuggestionsCollector) {
        
        let wordsOfSameLength = wordsByLength[word.characters.count] ?? []
        for candidate in wordsOfSameLength {
            let distance = wordDistance(word, candidate, threshold: collector.boundary)
            collector.addSuggestion(candidate, distance: distance)
        }
    }
}

extension Suggester {
    func capitalize(string: String) -> String {
        return string.capitalizedString
    }
    
    private func containsCapitalLetter(string: String) -> Bool {
        return string != string.lowercaseString
    }
}
