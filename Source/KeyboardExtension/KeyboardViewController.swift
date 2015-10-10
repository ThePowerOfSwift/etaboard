import UIKit

class KeyboardViewController: UIInputViewController {
    var document: Document!

    var suggester = Suggester()
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
    }
    
    func handleTap(recognizer: UIGestureRecognizer) {
        let touchPoint = recognizer.locationInView(self.keyboardView)
        let key = keyboardModel.closestKey(to: touchPoint)
        keyPressHandler?.handle(key)
    }
}

// MARK: - Suggestion Bar
extension KeyboardViewController {
    private func initSuggestionBar() {
        suggestionBar = SuggestionBarView(target: self, action: "didTapSuggestion:")
        suggestionBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(suggestionBar)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"didActivateUppercase:",
            name: KeyPressHandler.NotificationUppercaseActivatedName, object: nil)
        
        loadSuggestionsFromSystem()
        ["misc", "derewo", "top10000de", "top10000en"].forEach { dictionary in
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                self.loadSuggestionsFromDictionary(dictionary)
            })
        }
    }
    
    private func loadSuggestionsFromSystem() {
        requestSupplementaryLexiconWithCompletion { lexicon in
            let allEntries = lexicon.entries.map { $0.documentText }
            self.addSuggestions(allEntries, from: "System Lexicon")
        }
    }
    
    private func loadSuggestionsFromDictionary(basename: String) {
        guard let path = NSBundle.mainBundle().pathForResource(basename, ofType: "txt") else {
            NSLog("could not find dictionary '\(basename)'")
            return
        }
        do {
            let dictionaryAsString = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            let words = dictionaryAsString.split("\n")
            addSuggestions(words, from: basename)
        } catch _ as NSError {
            NSLog("could not load dictionary from path \(path)")
        }
    }
    
    private func addSuggestions(words: [String], from dictionary: String) {
        NSLog("entries in dictionary '\(dictionary)': \(words.count)")
        self.suggester.add(words)
    }
    
    func didTapSuggestion(sender: AnyObject?) {
        let button = sender as! UIButton
        let title = button.titleForState(.Normal)
        
        document?.replaceCurrentWord(title!)
    }
    
    func didActivateUppercase(notification: NSNotification) {
        suggestionBar.getCurrentSuggestion()
            |> suggester.capitalize
            |> suggestionBar.displaySuggestion
    }
}
