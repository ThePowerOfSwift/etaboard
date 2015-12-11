import UIKit
import RealmSwift

class KeyboardViewController: UIInputViewController {
    var document: Document!

    var suggester = SuggesterWithDictionaries.instance
    var suggestionBar: SuggestionBarView!

    var keyboardModel = KeyboardModel()
    var keyboardView: KeyboardView!
    var keyPressHandler: KeyPressHandler?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGrayColor()
        
        initDocument()
        initSuggestionBar()
        initKeyboardView()
        layoutSubviews()
    }
    
    private func layoutSubviews() {
        self.view.align([.Top, .Width], of: suggestionBar)
        self.view.align([.Width, .Bottom], of: keyboardView!)
        self.view.align(.Top, of: keyboardView!, with: .Bottom, of: suggestionBar)
    }
}


// MARK: - Document
extension KeyboardViewController {
    private func initDocument() {
        let newDocument = NotifyingDocument(wrapping: WordBasedDocument(proxy: textDocumentProxy))
        newDocument.delegate = self
        document = newDocument
    }
}

extension KeyboardViewController: DocumentDelegate {
    func didChangeCurrentWord(newCurrentWord: String?) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            let suggestion = self.suggester.suggestCompletion(to: newCurrentWord)
            dispatch_async(dispatch_get_main_queue(), {
                self.suggestionBar.displayVerbatim(newCurrentWord)
                self.suggestionBar.displaySuggestion(suggestion)
            })
        })
    }
}

// MARK: - Keyboard
extension KeyboardViewController {
    private func initKeyboardView() {
        keyPressHandler = KeyPressHandler(
            inputViewController: self,
            keyboard: keyboardModel,
            document: document!)
        
        keyboardView = KeyboardView.create(keyboardModel)
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        keyboardModel.delegate = keyboardView
        
        self.view.addSubview(keyboardView)
        
        let tapRecognizer = MyTapRecognizer(
            target: self, action: "handleTap:")
        keyboardView.addGestureRecognizer(tapRecognizer)
        
        NSLog("suggester size: \(SuggesterWithDictionaries.instance.size)")
    }
    
    func handleTap(recognizer: UIGestureRecognizer) {
        let touchPoint = recognizer.locationInView(self.keyboardView)
        let intendedTouchPoint = CGPointMake(touchPoint.x, touchPoint.y + 10)
        let key = keyboardModel.closestKey(to: intendedTouchPoint)
        keyPressHandler?.handle(key)
    }
}

// MARK: - Suggestion Bar
extension KeyboardViewController {
    private func initSuggestionBar() {
        suggestionBar = SuggestionBarView(target: self, action: "didTapSuggestion:")
        suggestionBar.translatesAutoresizingMaskIntoConstraints = false
        suggestionBar.onVerbatim(target: self, action: "didTapVerbatim:")
        self.view.addSubview(suggestionBar)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"didActivateUppercase:",
            name: KeyPressHandler.NotificationUppercaseActivatedName, object: nil)
        
        loadSuggestionsFromSystem()
    }
    
    private func loadSuggestionsFromSystem() {
        if SuggesterWithDictionaries.systemLexiconLoaded { return }
        
        requestSupplementaryLexiconWithCompletion { lexicon in
            let allEntries = lexicon.entries.map { $0.documentText }
            SuggesterWithDictionaries.instance.addUnknownLengths(allEntries)
            SuggesterWithDictionaries.systemLexiconLoaded = true
        }
    }

    func buttonTitle(sender: AnyObject?) -> String? {
        let button = sender as! UIButton
        return button.currentTitle
    }
    
    func didTapSuggestion(sender: AnyObject?) {
        if let word = buttonTitle(sender) { didSelectSuggestion(word) }
    }
    func didTapVerbatim(sender: AnyObject?) {
        if let word = buttonTitle(sender) { didSelectVerbatim(word) }
    }
    
    func didSelectSuggestion(word: String) {
        document?.replaceCurrentWord(word)
    }

    func didSelectVerbatim(verbatimWord: String) {
        didSelectSuggestion(verbatimWord)
        
        suggester.addUnknownLengths([verbatimWord])
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            do {
                let newDictionaryEntry = UserDictionaryEntry()
                newDictionaryEntry.word = verbatimWord
                let realm = try Realm()
                try realm.write {
                    realm.add(newDictionaryEntry, update: true)
                }
            } catch _ {
                NSLog("could not add '\(verbatimWord)' to user dictionary")
            }
        }
    }
    
    func didActivateUppercase(notification: NSNotification) {
        suggestionBar.getCurrentSuggestion()
            |> suggester.capitalize
            |> suggestionBar.displaySuggestion
    }
}
