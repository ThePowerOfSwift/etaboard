import UIKit
import PromiseKit

class SuggestionBarController: UIViewController {
    private let document: Document
    private let suggester: Suggester
    private let userDictionary: UserDictionary
    private var suggestionBar: SuggestionBarView
    private let completionQueue = dispatch_queue_create(
        "de.bepple.etaboard.completions", DISPATCH_QUEUE_SERIAL)

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
        suggestionBar.onSuggestion(target: self, action: "didTapSuggestion:")
        suggestionBar.onVerbatim(target: self, action: "didTapVerbatim:")
        
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
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"didActivateUppercase:",
            name: KeyPressHandler.NotificationUppercaseActivatedName, object: nil)
    }
    func didActivateUppercase(notification: NSNotification) {
        suggestionBar.mapSuggestions(suggester.capitalize)
    }
}

extension SuggestionBarController: DocumentDelegate {
    func didChangeCurrentWord(newCurrentWord: String?) {
        dispatch_promise(on: completionQueue) {
            let collector = TwoSuggestionsCollector()
            self.suggester.collectSuggestionsFor(newCurrentWord, into: collector)
            return collector.getSuggestions()
        }.then(self.suggestionBar.displaySuggestions)
        self.suggestionBar.displayVerbatim(newCurrentWord)
    }
}
