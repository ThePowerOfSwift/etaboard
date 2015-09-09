import UIKit

class KeyboardViewController: UIInputViewController {
    var keyboardView: KeyboardView?
    var keyboardModel = KeyboardModel()
    var keyPressHandler: KeyPressHandler?

    func handleTap(recognizer: UIGestureRecognizer) {
        let touchPoint = recognizer.locationInView(self.keyboardView)
        let key = keyboardModel.closestKey(to: touchPoint)
        keyPressHandler?.handle(key)
    }
    
    func didTapSuggestion(sender: AnyObject?) {
        let button = sender as! UIButton
        let title = button.titleForState(.Normal)
        (textDocumentProxy as! UIKeyInput).insertText(title!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var suggestionBar = SuggestionBarView.create(self, action: "didTapSuggestion:")
        suggestionBar.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(suggestionBar)
        
        self.view.backgroundColor = UIColor.darkGrayColor()
        
        keyPressHandler = KeyPressHandler(
            inputViewController: self,
            model: keyboardModel)
        
        keyboardView = KeyboardView.create(keyboardModel)
        keyboardView?.setTranslatesAutoresizingMaskIntoConstraints(false)
        keyboardModel.delegate = keyboardView
        
        self.view.addSubview(keyboardView!)

        self.view.align([.Top, .Width], of: suggestionBar)
        self.view.align([.Width, .Bottom], of: keyboardView!)
        self.view.align(.Top, of: keyboardView!, with: .Bottom, of: suggestionBar)

        let tapRecognizer = MyTapRecognizer(
            target: self, action: "handleTap:")
        keyboardView!.addGestureRecognizer(tapRecognizer)

    }
}
