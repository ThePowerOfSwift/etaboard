import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!

    func someAction2(sender:UITapGestureRecognizer){
        (textDocumentProxy as! UIKeyInput).insertText("G")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let tapRecognizer2 = UITapGestureRecognizer(target:self, action: "someAction2:")
        self.view.addGestureRecognizer(tapRecognizer2)
        self.view.backgroundColor = UIColor(red: 0.5, green: 0, blue:0, alpha: 0.1)
        
        
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as! UIButton
    
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
    
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
    
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
    }
}
