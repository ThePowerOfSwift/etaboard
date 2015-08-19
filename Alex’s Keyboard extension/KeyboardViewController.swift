import UIKit

class KeyboardViewController: UIInputViewController {

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
