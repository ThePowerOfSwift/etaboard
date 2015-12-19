import UIKit

class ExtensionRootController: UIInputViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGrayColor()
        
        let document = NotifyingDocument(wrapping: WordBasedDocument(proxy: textDocumentProxy))
        let suggestionBarController = initSuggestionBar(document)
        document.delegate = suggestionBarController

        let keyboardController = KeyboardController(document: document,
            nextKeyboardAction: { [unowned self] in self.advanceToNextInputMode() })
        addChildViewController(keyboardController)
        view.addSubview(keyboardController.view)

        layoutSubviews(
            suggestionBar: suggestionBarController.view,
            keyboard: keyboardController.view)
        
        NSLog("suggester size: \(SuggesterWithDictionaries.instance.size)")
    }
    
    private func layoutSubviews(suggestionBar suggestionBar: UIView, keyboard: UIView) {
        view.align([.Top, .Width], of: suggestionBar)
        view.align([.Width, .Bottom], of: keyboard)
        view.align(.Top, of: keyboard, with: .Bottom, of: suggestionBar)
    }
    
    private func initSuggestionBar(document: Document) -> SuggestionBarController {
        let suggestionBar = SuggestionBarController(
            inputController: self, document: document)
        addChildViewController(suggestionBar)
        view.addSubview(suggestionBar.view)
        return suggestionBar
    }
}

