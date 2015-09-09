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

        var suggestionBar = UIView()
        suggestionBar.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(suggestionBar)
        
        var buttonForSuggestion = UIButton.buttonWithType(.Custom) as! UIButton
        buttonForSuggestion.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        buttonForSuggestion.setTitle("Claudi", forState: .Normal)
        buttonForSuggestion.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonForSuggestion.addTarget(self, action: "didTapSuggestion:", forControlEvents: .TouchUpInside)
        
        suggestionBar.addSubview(buttonForSuggestion)

        var top = NSLayoutConstraint(item: buttonForSuggestion, attribute: .Top,
            relatedBy: .Equal, toItem: suggestionBar, attribute: .Top, multiplier: 1, constant: 0)
        var bottom = NSLayoutConstraint(item: buttonForSuggestion, attribute: .Height,
            relatedBy: .Equal, toItem: suggestionBar, attribute: .Height, multiplier: 1, constant: 0)
        var center = NSLayoutConstraint(item: buttonForSuggestion, attribute: .CenterX,
            relatedBy: .Equal, toItem: suggestionBar, attribute: .CenterX, multiplier: 1, constant: 0)
        suggestionBar.addConstraints([top, bottom, center])
        
        
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
