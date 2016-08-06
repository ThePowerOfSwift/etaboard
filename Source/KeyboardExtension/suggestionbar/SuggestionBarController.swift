import UIKit
import PromiseKit
import ReSwift

class SuggestionBarController: UIViewController {
    private let document: Document
    private let suggester: Suggester
    private let userDictionary: UserDictionary
    private var suggestionBar: SuggestionBarView
    private let completionQueue = dispatch_queue_create(
        "de.bepple.etaboard.completions", DISPATCH_QUEUE_SERIAL)
    private var suggestionsCollector: TwoSuggestionsCollector = TwoSuggestionsCollector()
    var primarySuggestion: String? {
        return suggestionsCollector.getSuggestions().first
    }

    init(document: Document, suggester: Suggester, userDictionary: UserDictionary) {
        self.document = document
        self.suggester = suggester
        self.userDictionary = userDictionary
        suggestionBar = SuggestionBarView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        suggestionBar.translatesAutoresizingMaskIntoConstraints = false
        suggestionBar.onSuggestion(target: self, action: #selector(self.didTapSuggestion(_:)))
        suggestionBar.onVerbatim(target: self, action: #selector(self.didTapVerbatim(_:)))
        
        self.view = suggestionBar
     
        toggleUppercase()
    }
    
    func didTapSuggestion(button: UIButton) {
        guard let word = button.currentTitle else { return }
        document.replaceCurrentWord(word)
    }
    
    func didTapVerbatim(button: UIButton) {
        guard let verbatimWord = button.currentTitle else { return }
        
        suggester.addUnknownLengths([verbatimWord])
        dispatch_promise {
            try self.userDictionary.addWord(verbatimWord)
        }.error { error in
            NSLog("Could not add '\(verbatimWord)' to user dictionary")
            NSLog("Underlying error: \(error)")
        }
        
        document.replaceCurrentWord(verbatimWord)
    }
}

extension SuggestionBarController {
    private func toggleUppercase() {
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: #selector(didActivateUppercase),
            name: KeyPressHandler.NotificationUppercaseActivatedName,
            object: nil)
    }
    func didActivateUppercase(notification: NSNotification) {
        mainStore.dispatch(CapitalizeSuggestionsAction())
    }
}

extension SuggestionBarController: DocumentDelegate {
    func didChangeCurrentWord(newCurrentWord: String?) {
        dispatch_promise(on: completionQueue) {
            self.suggestionsCollector = TwoSuggestionsCollector()
            self.suggester.collectSuggestionsFor(newCurrentWord, into: self.suggestionsCollector)
            return self.suggestionsCollector.getSuggestions()
        }.then(self.postNewSuggestions)
        self.suggestionBar.displayVerbatim(newCurrentWord)
    }
    private func postNewSuggestions(suggestions: [String]) {
        mainStore.dispatch(
            UpdateSuggestionsAction(suggestions: suggestions)
        )
    }
}

extension SuggestionBarController: StoreSubscriber {
    override func viewWillAppear(animated: Bool) {
        mainStore.subscribe(self)
    }
    override func viewWillDisappear(animated: Bool) {
        mainStore.unsubscribe(self)
    }
    func newState(state: AppState) {
        suggestionBar.displaySuggestions(state.suggestions)
    }
}
