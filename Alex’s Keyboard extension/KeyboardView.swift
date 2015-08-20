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