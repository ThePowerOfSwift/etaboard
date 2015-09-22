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
    var words = ["Moin", "mwa", "Claudi"] {
        didSet {
            wordsByLength = words.groupBy { $0.characters.count }
        }
    }
    
    func suggestCompletion(to currentContext: String?) -> String? {
        if let currentWord = currentContext {
            return findClosestWord(to: currentWord)
        }
        return "😊"
    }
    
    func findClosestWord(to word: String) -> String? {
        let wordsOfSameLength = wordsByLength[word.characters.count] ?? []
        return findClosestWord(to: word, from: wordsOfSameLength)
    }
    
    func findClosestWord(to word: String, from words: [String]) -> String? {
        let byDistanceTo = { base in
            { levenshteinDistance($0, s2: base) < levenshteinDistance($1, s2: base) }
        }
        let wordsByEditDistance = words.sort(byDistanceTo(word))
        return wordsByEditDistance.first
    }
}
