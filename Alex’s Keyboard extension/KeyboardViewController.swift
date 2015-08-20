import UIKit

class KeyboardView: UIView {
    var buttonSize: CGFloat = 0
    var buttonOffset: CGFloat = 0
    var attributes: [NSObject: AnyObject]?
    
    func initButtonAttributes() {
        buttonSize = UIFont.buttonFontSize()
        buttonOffset = buttonSize / 2
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.alignment = NSTextAlignment.Center
        attributes = [
            NSForegroundColorAttributeName: UIColor.lightTextColor(),
            NSFontAttributeName: UIFont.systemFontOfSize(UIFont.buttonFontSize()),
            NSParagraphStyleAttributeName: paraStyle
        ]
    }
    
    override func drawRect(rect: CGRect) {
        NSLog("drawing keyboard \(NSStringFromCGRect(rect))")
        
        draw("a", at: (15, 10))
        draw("l", at: (100, 60))
    }
    
    func draw(key: String, at: (CGFloat, CGFloat)) {
        key.drawInRect(CGRectMake(at.0 - buttonOffset, at.1 - buttonOffset, buttonSize, buttonSize), withAttributes: attributes)
    }
    
    static func create() -> KeyboardView {
        var keyboardView = KeyboardView()
        keyboardView.backgroundColor = UIColor.darkGrayColor()
        keyboardView.initButtonAttributes()
        return keyboardView
    }
}

class KeyboardViewController: UIInputViewController {
    var keyboardView: KeyboardView?

    func distanceBetween(pointA: (CGFloat, CGFloat), pointB: (CGFloat, CGFloat)) -> CGFloat {
        let dx = pointA.0 - pointB.0
        let dy = pointA.1 - pointB.1
        return sqrt(dx*dx + dy*dy)
    }
    
    func someAction2(sender:UITapGestureRecognizer){
        let touchPoint = sender.locationInView(self.view)
        NSLog("tap at (%.1f,%.1f)", touchPoint.x, touchPoint.y)
        
        var ax = view.bounds.size.width / 4
        var ay = view.bounds.size.height / 4
        var lx = view.bounds.size.width / 4 * 3
        var ly = view.bounds.size.height / 4 * 3
        
        var keyForDistance = [CGFloat: String]()
        keyForDistance[distanceBetween((ax, ay), pointB: (touchPoint.x, touchPoint.y))] = "a"
        keyForDistance[distanceBetween((lx, ly), pointB: (touchPoint.x, touchPoint.y))] = "l"
        
        var closestKey = keyForDistance[minElement(keyForDistance.keys)]!
        (textDocumentProxy as! UIKeyInput).insertText(closestKey)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapRecognizer2 = UITapGestureRecognizer(target:self, action: "someAction2:")
        self.view.addGestureRecognizer(tapRecognizer2)
        
        keyboardView = KeyboardView.create()
        self.view.addSubview(keyboardView!)
        
        addNextKeyboardButton()
    }
    
    override func viewWillLayoutSubviews() {
        NSLog("size: (%.1f,%.1f)", view.bounds.width, view.bounds.height)
        keyboardView!.frame = CGRectMake(0, 0, view.bounds.width, view.bounds.height)
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
