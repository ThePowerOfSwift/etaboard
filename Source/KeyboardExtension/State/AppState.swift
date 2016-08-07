import ReSwift

struct AppState: StateType {
    var suggestions: [String] = []
}

struct NewSuggestionsAction: Action {
    let suggestions: [String]
}
struct CapitalizeSuggestionsAction: Action {}

struct AppReducer: Reducer {
    func handleAction(action: Action, state: AppState?) -> AppState {
        var state = state ?? AppState(
            suggestions: []
        )
        
        switch action {
        case let action as NewSuggestionsAction:
            state.suggestions = action.suggestions
        case _ as CapitalizeSuggestionsAction:
            state.suggestions = state.suggestions.map(Suggester.capitalize)
        default:
            break
        }
        
        return state
    }
}

func getPrimarySuggestion(state: AppState) -> String? {
    return state.suggestions.first
}