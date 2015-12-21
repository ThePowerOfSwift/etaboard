import UIKit

class ExtensionRootController: UIInputViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGrayColor()
        
        let document = NotifyingDocument(wrapping: WordBasedDocument(proxy: textDocumentProxy))
        
        let suggestionBarController = SuggestionBarController(document: document,
            suggester: SuggesterWithDictionaries.instance,
            userDictionary: UserDictionary())
        addChild(suggestionBarController)
        
        document.delegate = suggestionBarController

        let keyboardController = KeyboardController(document: document,
            nextKeyboardAction: { [unowned self] in self.advanceToNextInputMode() })
        addChild(keyboardController)

        layoutSubviews(
            suggestionBar: suggestionBarController.view,
            keyboard: keyboardController.view)
        
        loadSuggestionsFromSystem()
        NSLog("suggester size: \(SuggesterWithDictionaries.instance.size)")
    }
    
    private func layoutSubviews(suggestionBar suggestionBar: UIView, keyboard: UIView) {
        view.align([.Top, .Width], of: suggestionBar)
        view.align([.Width, .Bottom], of: keyboard)
        view.align(.Top, of: keyboard, with: .Bottom, of: suggestionBar)
    }
    
    private func addChild(controller: UIViewController) {
        addChildViewController(controller)
        view.addSubview(controller.view)
    }
    
    private func loadSuggestionsFromSystem() {
        if SuggesterWithDictionaries.systemLexiconLoaded { return }
        
        requestSupplementaryLexiconWithCompletion { lexicon in
            let allEntries = lexicon.entries.map { $0.documentText }
            SuggesterWithDictionaries.instance.addUnknownLengths(allEntries)
            SuggesterWithDictionaries.systemLexiconLoaded = true
        }
    }
}

