import Foundation

class Suggester {
    private var wordsByLength = [Int: [String]]()
    
    func add(newWords: [String]) {
        let newWordsByLength = newWords.groupBy { $0.characters.count }
        for (length, newWordsForLength) in newWordsByLength {
            if var existingWordsForLength = wordsByLength[length] {
                existingWordsForLength.appendContentsOf(newWordsForLength)
            } else {
                wordsByLength[length] = newWordsForLength
            }
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
    
    func capitalize(string: String?) -> String? {
        return string?.capitalizedString
    }
    
    private func containsCapitalLetter(string: String) -> Bool {
        return string != string.lowercaseString
    }
    
    private func findClosestWord(to word: String) -> String? {
        let wordsOfSameLength = wordsByLength[word.characters.count] ?? []
        return findClosestWord(to: word, from: wordsOfSameLength)
    }
    
    private func findClosestWord(to word: String, from words: [String]) -> String? {
        var bestDistance = Double(Int.max)
        var bestCandidate: String? = nil
        for candidate in words {
            let distance = levenshteinDistance(word, s2: candidate)
            if distance < bestDistance {
                bestDistance = distance
                bestCandidate = candidate
            }
        }
        return bestCandidate
    }
}
