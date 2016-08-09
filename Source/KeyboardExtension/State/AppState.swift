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

class DocumentActions {
    private let document: Document
    
    init(_ document: Document) {
        self.document = document
    }

    func CompleteSuggestion(suggestion: String) -> ((AppState, Store<AppState>) -> Action?) {
        return { _, _ in
            return self.CompleteSuggestion(suggestion)
        }
    }
    
    func CompleteSuggestion(state: AppState, store: Store<AppState>) -> Action? {
        return CompleteSuggestionWithSuffix(state, store)
    }
    
    func CompleteSuggestionAndProceed(state: AppState, store: Store<AppState>) -> Action? {
        return CompleteSuggestionWithSuffix(state, store, suffix: " ")
    }

    private func CompleteSuggestionWithSuffix(state: AppState, _ store: Store<AppState>, suffix: String = "") -> Action? {
        guard let suggestion = getPrimarySuggestion(state) else { return nil }
        return CompleteSuggestion(suggestion + suffix)
    }

    private func CompleteSuggestion(suggestion: String) -> Action {
        document.replaceToken(suggestion)
        return DeactivateCapitalization()
    }
}
