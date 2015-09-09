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

        var alignSuggestionBarWidth = NSLayoutConstraint(item: suggestionBar, attribute: .Width,
            relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1, constant: 0)
        var alignSuggestionBarTop = NSLayoutConstraint(item: suggestionBar, attribute: .Top,
            relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: 0)
        self.view.addConstraints([alignSuggestionBarWidth, alignSuggestionBarTop])

        var keyboardWidth = NSLayoutConstraint(item: keyboardView!, attribute: .Width,
            relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1, constant: 0)
        var keyboardTop = NSLayoutConstraint(item: keyboardView!, attribute: .Top,
            relatedBy: .Equal, toItem: suggestionBar, attribute: .Bottom, multiplier: 1, constant: 0)
        var keyboardBottom = NSLayoutConstraint(item: keyboardView!, attribute: .Bottom,
            relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1, constant: 0)
        self.view.addConstraints([keyboardWidth, keyboardTop, keyboardBottom])

        let tapRecognizer = MyTapRecognizer(
            target: self, action: "handleTap:")
        keyboardView!.addGestureRecognizer(tapRecognizer)

    }
}
