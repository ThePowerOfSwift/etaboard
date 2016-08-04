import UIKit

class Instances {
    static let systemDictionaryLoader = SystemDictionaryLoader()
    static let suggester = SuggesterWithDictionaries().createSuggester()
}

class ExtensionRootController: UIInputViewController {
    private var document: Document?
    private var suggestionBarController: SuggestionBarController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGrayColor()
        
        let document = NotifyingDocument(wrapping: WordBasedDocument(proxy: textDocumentProxy))
        self.document = document
        
        let suggestionBarController = SuggestionBarController(document: document,
            suggester: Instances.suggester,
            userDictionary: UserDictionary())
        self.suggestionBarController = suggestionBarController
        addChild(suggestionBarController)
        
        document.delegate = suggestionBarController

        let keyboardController = KeyboardController(document: document,
            nextKeyboardAction: { [unowned self] in self.advanceToNextInputMode() },
            onSwipeDown: self.completeSuggestion)
        addChild(keyboardController)

        layoutSubviews(
            suggestionBar: suggestionBarController.view,
            keyboard: keyboardController.view)
        
        Instances.systemDictionaryLoader.load(from: self, into: Instances.suggester)
        NSLog("suggester size: \(Instances.suggester.size)")
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
    
    func completeSuggestion() {
        NSLog("complete suggestion")
        guard let suggestion = suggestionBarController?.primarySuggestion else { return }
        document?.replaceCurrentWord(suggestion)
    }
}

