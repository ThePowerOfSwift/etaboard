import Foundation

public extension SequenceType {
    func groupBy<U : Hashable>(@noescape keyFunc: Generator.Element -> U) -> [U:[Generator.Element]] {
        var dict: [U:[Generator.Element]] = [:]
        for el in self {
            let key = keyFunc(el)
            dict[key]?.append(el) ?? {dict[key] = [el]}()
        }
        return dict
    }
}

class Suggester {
    var wordsByLength: [Int: [String]]!
    var words = [String]() {
        didSet {
            wordsByLength = words.groupBy { $0.characters.count }
        }
    }
    
    func suggestCompletion(to currentContext: String?) -> String? {
        NSLog("asked for suggestion for: \(currentContext)")
        guard let currentWord = currentContext else { return nil }
        
        let suggestion = findClosestWord(to: currentWord)
        if (containsCapitalLetter(currentWord)) {
            return suggestion?.capitalizedString
        }
        return suggestion
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
