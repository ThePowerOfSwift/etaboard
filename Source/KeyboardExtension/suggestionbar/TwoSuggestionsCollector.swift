
class TwoSuggestionsCollector: SuggestionsCollector {
    private var suggestions: [(suggestion: String, distance: Distance)] = []
    
    func addSuggestion(suggestion: String, distance: Distance) {
        suggestions.append((suggestion: suggestion, distance: distance))
        suggestions.sortInPlace { one, two in one.distance < two.distance }
        if suggestions.count > 2 { suggestions.removeLast() }
    }
    func mapSuggestions(functor: String -> String) {
        suggestions = suggestions.map { (suggestion: functor($0.suggestion),
            distance: $0.distance) }
    }
    func getSuggestions() -> [String] {
        return suggestions.map { $0.suggestion }
    }
}