import UIKit

class KeyboardViewController: UIInputViewController {

    func someAction2(sender:UITapGestureRecognizer){
        (textDocumentProxy as! UIKeyInput).insertText("G")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 0.5, green: 0, blue:0, alpha: 0.1)
    
        let tapRecognizer2 = UITapGestureRecognizer(target:self, action: "someAction2:")
        self.view.addGestureRecognizer(tapRecognizer2)
        
        addNextKeyboardButton()
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
