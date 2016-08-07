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
        
        let containsOnlyPunctuation = currentWord.stringByTrimmingCharactersInSet(
            NSCharacterSet.punctuationCharacterSet()).isEmpty
        if containsOnlyPunctuation {
            collector.addSuggestion(currentWord, distance: Distance.min)
            return
        }
        
        collectSuggestionsWithDistancesFor(currentWord, into: collector)
        if (containsCapitalLetter(currentWord)) {
            collector.mapSuggestions(Suggester.capitalize)
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
    static func capitalize(string: String) -> String {
        guard let first = string.characters.first else { return string }
        return String(first).uppercaseString + String(string.characters.dropFirst())
    }
    
    private func containsCapitalLetter(string: String) -> Bool {
        return string != string.lowercaseString
    }
}
