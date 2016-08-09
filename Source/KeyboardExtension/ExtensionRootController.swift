import UIKit
import ReSwift

let store = Store<AppState>(
    reducer: AppReducer(),
    state: nil
)

class Instances {
    static let systemDictionaryLoader = SystemDictionaryLoader()
    static let suggester = SuggesterWithDictionaries().createSuggester()
}

class ExtensionRootController: UIInputViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGrayColor()
        
        let document = NotifyingDocument(wrapping: UIBackedDocument(proxy: textDocumentProxy))
        let documentActions = DocumentActions(document)
        
        let suggestionBarController = SuggestionBarController(
            document: document,
            documentActions: documentActions,
            suggester: Instances.suggester,
            userDictionary: UserDictionary())
        addChild(suggestionBarController)
        
        document.delegate = suggestionBarController

        let keyboardController = KeyboardController(document: document,
            nextKeyboardAction: { [unowned self] in self.advanceToNextInputMode() },
            onSwipeDown: { store.dispatch(documentActions.CompleteSuggestion) },
            onSwipeRight: { store.dispatch(documentActions.CompleteSuggestionAndProceed) }
        )
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
}

