import ReSwift

struct AppState: StateType {
    var suggestions: [String] = []
    var capitalize = false
}

struct PostNewSuggestions: Action {
    let suggestions: [String]
}

struct ActivateCapitalization: Action {}
struct DeactivateCapitalization: Action {}

struct AppReducer: Reducer {
    func handleAction(action: Action, state: AppState?) -> AppState {
        var state = state ?? AppState(
            suggestions: [],
            capitalize: false
        )
        
        switch action {
        case let action as PostNewSuggestions:
            state.suggestions = action.suggestions
        case _ as ActivateCapitalization:
            state.capitalize = true
            state.suggestions = state.suggestions.map(Suggester.capitalize)
        case _ as DeactivateCapitalization:
            state.capitalize = false
        default:
            break
        }
        
        return state
    }
}

func getPrimarySuggestion(state: AppState) -> String? {
    return state.suggestions.first
}