import PromiseKit
import RealmSwift

class SuggestionBarController: UIViewController {
    var document: Document
    
    var suggester = SuggesterWithDictionaries.instance
    var suggestionBar: SuggestionBarView!

    init(inputController: UIInputViewController, document: Document) {
        self.document = document
        super.init(nibName: nil, bundle: nil)
        
        loadSuggestionsFromSystem(inputController)
    }
    
    override func loadView() {
        suggestionBar = SuggestionBarView(target: self, action: "didTapSuggestion:")
        suggestionBar.translatesAutoresizingMaskIntoConstraints = false
        suggestionBar.onVerbatim(target: self, action: "didTapVerbatim:")
        
        self.view = suggestionBar
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"didActivateUppercase:",
            name: KeyPressHandler.NotificationUppercaseActivatedName, object: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadSuggestionsFromSystem(inputController: UIInputViewController) {
        if SuggesterWithDictionaries.systemLexiconLoaded { return }
        
        inputController.requestSupplementaryLexiconWithCompletion { lexicon in
            let allEntries = lexicon.entries.map { $0.documentText }
            SuggesterWithDictionaries.instance.addUnknownLengths(allEntries)
            SuggesterWithDictionaries.systemLexiconLoaded = true
        }
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
            let newDictionaryEntry = UserDictionaryEntry()
            newDictionaryEntry.word = verbatimWord
            let realm = try Realm()
            try realm.write {
                realm.add(newDictionaryEntry, update: true)
            }
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