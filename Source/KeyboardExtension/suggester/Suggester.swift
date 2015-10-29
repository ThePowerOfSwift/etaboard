import Foundation

class Suggester {
    private var wordsByLength = [Int: [String]]()
    
    var size: Int {
        get {
            return wordsByLength.values.map { $0.count } .reduce(0, combine: +)
        }
    }
    
    func add(newWords: [String]) {
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
            let distance = wordDistance(word, s2: candidate)
            if distance < bestDistance {
                bestDistance = distance
                bestCandidate = candidate
            }
        }
        return bestCandidate
    }
}
