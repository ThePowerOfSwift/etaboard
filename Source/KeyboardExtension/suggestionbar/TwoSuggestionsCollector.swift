
class TwoSuggestionsCollector: SuggestionsCollector {
    private var result1 = (suggestion: "", distance: Double(Int.max))
    private var result2 = (suggestion: "", distance: Double(Int.max))
    
    func addSuggestion(newSuggestion: String, distance newDistance: Distance = 0) {
        if newDistance < result1.distance {
            result2 = result1
            result1 = (suggestion: newSuggestion, distance: newDistance)
        } else if newDistance < result2.distance {
            result2 = (suggestion: newSuggestion, distance: newDistance)
        }
    }
    
    func mapSuggestions(functor: String -> String) {
        result1.suggestion = functor(result1.suggestion)
        result2.suggestion = functor(result2.suggestion)
    }
    func getSuggestions() -> [String] {
        return [result1.suggestion, result2.suggestion]
    }
}
