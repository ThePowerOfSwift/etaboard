import ReSwift

struct AppState: StateType {
    var suggestions: [String] = []
}

struct PostNewSuggestions: Action {
    let suggestions: [String]
}
struct ActivateCapitalization: Action {}

struct AppReducer: Reducer {
    func handleAction(action: Action, state: AppState?) -> AppState {
        var state = state ?? AppState(
            suggestions: []
        )
        
        switch action {
        case let action as PostNewSuggestions:
            state.suggestions = action.suggestions
        case _ as ActivateCapitalization:
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