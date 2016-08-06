import ReSwift

struct AppState: StateType {
    var suggestions: [String] = []
}

struct UpdateSuggestionsAction: Action {
    let suggestions: [String]
}

struct AppReducer: Reducer {
    func handleAction(action: Action, state: AppState?) -> AppState {
        var state = state ?? AppState(
            suggestions: []
        )
        
        switch action {
        case let action as UpdateSuggestionsAction:
            state.suggestions = action.suggestions
        default:
            break
        }
        
        return state
    }
}

func getPrimarySuggestion(state: AppState) -> String? {
    return state.suggestions.first
}