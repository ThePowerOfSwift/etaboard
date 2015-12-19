import UIKit

class KeyboardViewController: UIInputViewController {
    let keyboardModel = KeyboardModel()
    var keyboardView: KeyboardView?
    var keyPressHandler: KeyPressHandler?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGrayColor()
        
        let document = NotifyingDocument(wrapping: WordBasedDocument(proxy: textDocumentProxy))
        let suggestionBarController = initSuggestionBar(document)
        document.delegate = suggestionBarController

        keyPressHandler = KeyPressHandler(
            nextKeyboardAction: { self.advanceToNextInputMode() },
            keyboard: keyboardModel,
            document: document)
        
        let keyboardView = initKeyboardView(keyboardModel)
        self.keyboardView = keyboardView
        keyboardModel.delegate = keyboardView

        layoutSubviews(suggestionBar: suggestionBarController.view, keyboard: keyboardView)
        
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


// MARK: - Keyboard
extension KeyboardViewController {
    private func initKeyboardView(model: KeyboardModel) -> KeyboardView {
        let keyboardView = KeyboardView.create(model)
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        
        let tapRecognizer = MyTapRecognizer(target: self, action: "handleTap:")
        keyboardView.addGestureRecognizer(tapRecognizer)
        
        view.addSubview(keyboardView)
        return keyboardView
    }
    
    func handleTap(recognizer: UIGestureRecognizer) {
        let touchPoint = recognizer.locationInView(keyboardView)
        let intendedTouchPoint = CGPointMake(touchPoint.x, touchPoint.y + 5)
        let key = keyboardModel.closestKey(to: intendedTouchPoint)
        keyPressHandler?.handle(key)
    }
}
