import UIKit
import PromiseKit

class SuggestionBarController: UIViewController {
    private let document: Document
    private let suggester = SuggesterWithDictionaries.instance
    private let userDictionary: UserDictionary
    private var suggestionBar: SuggestionBarView!

    init(document: Document, userDictionary: UserDictionary) {
        self.document = document
        self.userDictionary = userDictionary
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        suggestionBar = SuggestionBarView(target: self, action: "didTapSuggestion:")
        suggestionBar.translatesAutoresizingMaskIntoConstraints = false
        suggestionBar.onVerbatim(target: self, action: "didTapVerbatim:")
        
        self.view = suggestionBar
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"didActivateUppercase:",
            name: KeyPressHandler.NotificationUppercaseActivatedName, object: nil)
    }

    func didTapSuggestion(button: UIButton) {
        guard let word = button.currentTitle else { return }
        document.replaceCurrentWord(word)
    }
    
    func didTapVerbatim(button: UIButton) {
        guard let verbatimWord = button.currentTitle else { return }
        
        document.replaceCurrentWord(verbatimWord)
        suggester.addUnknownLengths([verbatimWord])
        dispatch_promise {
            try self.userDictionary.addWord(verbatimWord)
        }.error { error in
            NSLog("Could not add '\(verbatimWord)' to user dictionary")
            NSLog("Underlying error: \(error)")
        }
    }
    
    func didActivateUppercase(notification: NSNotification) {
        suggestionBar.getCurrentSuggestion()
            |> suggester.capitalize
            |> suggestionBar.displaySuggestion
    }    
}

extension SuggestionBarController: DocumentDelegate {
    func didChangeCurrentWord(newCurrentWord: String?) {
        dispatch_promise { self.suggester.suggestCompletion(to: newCurrentWord) }
            .then(self.suggestionBar.displaySuggestion)
        self.suggestionBar.displayVerbatim(newCurrentWord)
    }
}