class Suggester {
    let words = ["Moin", "mwa", "Claudi"]
    
    func suggestCompletion(to currentContext: String?) -> String {
        if let currentWord = currentContext {
            let byDistanceTo = { base in
                { levenshteinDistance($0, base) < levenshteinDistance($1, base) }
            }
            let wordsByEditDistance = words.sort(byDistanceTo(currentWord))
            return wordsByEditDistance.first!
        }
        return "😊"
    }
}