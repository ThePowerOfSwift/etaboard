import UIKit

class KeyboardView: UIView {
    var buttonSize: CGFloat = 0
    var buttonOffset: CGFloat = 0
    var attributes: [NSObject: AnyObject]?
    
    var model: KeyboardModel?
    
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
        
        for (key, coordinates) in model!.keysWithCoordinates() {
            draw(key, at: coordinates)
        }
    }
    
    func draw(key: String, at: (CGFloat, CGFloat)) {
        key.drawInRect(CGRectMake(at.0 - buttonOffset, at.1 - buttonOffset, buttonSize, buttonSize), withAttributes: attributes)
    }
    
    static func create(model: KeyboardModel) -> KeyboardView {
        var keyboardView = KeyboardView()
        keyboardView.backgroundColor = UIColor.darkGrayColor()
        keyboardView.initButtonAttributes()
        keyboardView.model = model
        return keyboardView
    }
}