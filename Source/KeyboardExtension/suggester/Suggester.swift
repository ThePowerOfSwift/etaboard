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
            collector.addSuggestion(candidate, distance: wordDistance(word, candidate))
        }
    }

    
    func suggestCompletion(to currentContext: String?) -> String? {
        NSLog("asked for suggestion for: \(currentContext)")
        guard let currentWord = currentContext else { return nil }
        
        let suggestion = findClosestWord(to: currentWord)
        if (containsCapitalLetter(currentWord)) {
            return capitalize(suggestion)
        }
        return suggestion
    }
    
    func capitalize(string: String) -> String {
        return string.capitalizedString
    }
    
    private func containsCapitalLetter(string: String) -> Bool {
        return string != string.lowercaseString
    }
    
    private func findClosestWord(to word: String) -> String {
        let wordsOfSameLength = wordsByLength[word.characters.count] ?? []
        return findClosestWord(to: word, from: wordsOfSameLength)
    }
    
    private func findClosestWord(to word: String, from words: [String]) -> String {
        let collector = OneSuggestionCollector()
        for candidate in words {
            collector.addSuggestion(candidate, distance: wordDistance(word, candidate))
        }
        return collector.getBestSuggestion()
    }
}
