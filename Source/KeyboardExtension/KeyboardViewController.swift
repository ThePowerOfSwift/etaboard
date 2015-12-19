import UIKit

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
        
        let newDocument = NotifyingDocument(wrapping: WordBasedDocument(proxy: textDocumentProxy))
        document = newDocument
        
        let suggestionBarController = SuggestionBarController(
            inputController: self, document: document)
        addChildViewController(suggestionBarController)
        self.view.addSubview(suggestionBarController.view)
        
        newDocument.delegate = suggestionBarController

        initKeyboardView()
        layoutSubviews(suggestionBarController)
    }
    
    private func layoutSubviews(suggestionBar: SuggestionBarController) {
        self.view.align([.Top, .Width], of: suggestionBar.view)
        self.view.align([.Width, .Bottom], of: keyboardView!)
        self.view.align(.Top, of: keyboardView!, with: .Bottom, of: suggestionBar.view)
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
        let intendedTouchPoint = CGPointMake(touchPoint.x, touchPoint.y + 5)
        let key = keyboardModel.closestKey(to: intendedTouchPoint)
        keyPressHandler?.handle(key)
    }
}
