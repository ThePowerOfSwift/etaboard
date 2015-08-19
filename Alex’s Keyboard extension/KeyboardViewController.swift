import UIKit

class MyView: UIView {
    init() {
        super.init(frame: CGRectMake(0, 80, 320, 40))
        backgroundColor = UIColor(red: 0, green: 0.5, blue:0.5, alpha: 0.5)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        NSLog("myview")
    }
}

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    func keyPressed(sender: AnyObject?) {
        NSLog("bar")
        let button = sender as! UIButton
        let title = button.titleForState(.Normal)
        (textDocumentProxy as! UIKeyInput).insertText(title!)
    }
    
    func someAction(sender:UITapGestureRecognizer){
        NSLog("baz")
        (textDocumentProxy as! UIKeyInput).insertText("F")
    }

    func someAction2(sender:UITapGestureRecognizer){
        NSLog("baz2")
        (textDocumentProxy as! UIKeyInput).insertText("G")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        var topRow = UIView(frame: CGRectMake(0, 0, 320, 40))
        topRow.backgroundColor = UIColor(red: 0, green: 0, blue:0.5, alpha: 0.5)
        
        self.view.addSubview(topRow)
        
        self.view.addSubview(MyView())
        
        let tapRecognizer = UITapGestureRecognizer(target:self, action: "someAction:")
        topRow.addGestureRecognizer(tapRecognizer)
        
        let tapRecognizer2 = UITapGestureRecognizer(target:self, action: "someAction2:")
        self.view.addGestureRecognizer(tapRecognizer2)
        self.view.backgroundColor = UIColor(red: 0.5, green: 0, blue:0, alpha: 0.1)
        
        
        // Perform custom UI setup here
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func textWillChange(textInput: UITextInput) {
    }

    override func textDidChange(textInput: UITextInput) {
        var textColor: UIColor
        var proxy = self.textDocumentProxy as! UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }

}
