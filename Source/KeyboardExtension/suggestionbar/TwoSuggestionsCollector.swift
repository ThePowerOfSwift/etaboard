
class TwoSuggestionsCollector: SuggestionsCollector {
    private var suggestions: [(suggestion: String, distance: Distance)] = []
    
    func addSuggestion(suggestion: String, distance: Distance) {
        suggestions.append((suggestion: suggestion, distance: distance))
        suggestions.sortInPlace { one, two in one.distance < two.distance }
        if suggestions.count > 2 { suggestions.removeLast() }
    }
    func mapSuggestions(functor: String? -> String?) {
        
    }
    func getSuggestions() -> [String] {
        return suggestions.map { $0.suggestion }
    }
}