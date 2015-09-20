class Suggester {
    var words = ["Moin", "mwa", "Claudi"]
    
    func suggestCompletion(to currentContext: String?) -> String? {
        if let currentWord = currentContext {
            return findClosestWord(to: currentWord)
        }
        return "😊"
    }
    
    func findClosestWord(to word: String) -> String? {
        let lengthOfCurrentWord = word.characters.count
        let wordsOfSameLength = words.filter { $0.characters.count == lengthOfCurrentWord }
        return findClosestWord(to: word, from: wordsOfSameLength)
    }
    
    func findClosestWord(to word: String, from words: [String]) -> String? {
        let byDistanceTo = { base in
            { levenshteinDistance($0, base) < levenshteinDistance($1, base) }
        }
        let wordsByEditDistance = words.sort(byDistanceTo(word))
        return wordsByEditDistance.first
    }
}