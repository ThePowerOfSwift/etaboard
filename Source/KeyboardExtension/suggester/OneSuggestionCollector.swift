
class OneSuggestionCollector {
    private var bestDistance = Double(Int.max)
    private var bestSuggestion: String? = nil

    func addSuggestion(suggestion: String, distance: Distance) {
        if distance < bestDistance {
            bestDistance = distance
            bestSuggestion = suggestion
        }
    }
    
    func getBestSuggestion() -> String? {
        return bestSuggestion
    }
}