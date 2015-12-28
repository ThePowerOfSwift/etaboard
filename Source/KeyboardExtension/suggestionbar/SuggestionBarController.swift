import UIKit
import PromiseKit

class SuggestionBarController: UIViewController {
    private let document: Document
    private let suggester: Suggester
    private let userDictionary: UserDictionary
    private var suggestionBar: SuggestionBarView!

    init(document: Document, suggester: Suggester, userDictionary: UserDictionary) {
        self.document = document
        self.suggester = suggester
        self.userDictionary = userDictionary
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        suggestionBar = SuggestionBarView()
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
        suggestionBar.getCurrentSuggestions()
            .map(suggester.capitalize)
            |> suggestionBar.displaySuggestions
    }
}

extension SuggestionBarController: DocumentDelegate {
    func didChangeCurrentWord(newCurrentWord: String?) {
        dispatch_promise { self.suggester.suggestCompletion(to: newCurrentWord) }
            .then { self.suggestionBar.displaySuggestions([$0]) }
        self.suggestionBar.displayVerbatim(newCurrentWord)
    }
}