
protocol SuggestionsCollector {
    func addSuggestion(suggestion: String, distance: Distance)
    func mapSuggestions(functor: String? -> String?)
}
