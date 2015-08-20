import UIKit

class KeyboardViewController: UIInputViewController {
    var keyboardView: KeyboardView?
    var keyboardModel = KeyboardModel()

    func userDidTap(sender:UITapGestureRecognizer){
        let touchPoint = sender.locationInView(self.view)
        NSLog("tap at (%.1f,%.1f)", touchPoint.x, touchPoint.y)
        (textDocumentProxy as! UIKeyInput).insertText(keyboardModel.key(touchPoint))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapRecognizer2 = UITapGestureRecognizer(target:self, action: "userDidTap:")
        self.view.addGestureRecognizer(tapRecognizer2)
        
        keyboardView = KeyboardView.create(keyboardModel)
        self.view.addSubview(keyboardView!)
        
        addNextKeyboardButton()
    }
    
    override func viewWillLayoutSubviews() {
        NSLog("size: (%.1f,%.1f)", view.bounds.width, view.bounds.height)
        keyboardView!.frame = CGRectMake(0, 0, view.bounds.width, view.bounds.height)
        keyboardModel.keyboardSize = view.bounds.size
        keyboardView!.setNeedsDisplay()
    }
    
    func addNextKeyboardButton() {
        var nextKeyboardButton = UIButton.buttonWithType(.System) as! UIButton
        
        nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        nextKeyboardButton.sizeToFit()
        nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(nextKeyboardButton)
        
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
    }
}
