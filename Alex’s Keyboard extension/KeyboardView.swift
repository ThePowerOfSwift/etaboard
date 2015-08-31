import UIKit

class KeyboardView: UIView {
    var buttonSize: CGFloat = 0
    var buttonOffset: CGFloat = 0
    var attributes: [NSObject: AnyObject]?
    
    var model: KeyboardModel?
    
    func initButtonAttributes() {
        let font = UIFont.systemFontOfSize(UIFont.buttonFontSize())
        buttonSize = font.pointSize + abs(font.descender)
        buttonOffset = buttonSize / 2
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.alignment = NSTextAlignment.Center
        attributes = [
            NSForegroundColorAttributeName: UIColor.lightTextColor(),
            NSFontAttributeName: font,
            NSParagraphStyleAttributeName: paraStyle
        ]
    }
    
    override func drawRect(rect: CGRect) {
        NSLog("drawing keyboard \(NSStringFromCGRect(rect))")
        
        for (key, coordinates) in model!.keysWithCoordinates() {
            var symbolToRender = key
            if key == KeyboardModel.Enter { symbolToRender = "⏎" }
            if key == KeyboardModel.Backspace { symbolToRender = "⌫" }
            if key == KeyboardModel.Space { symbolToRender = "＿＿" }
            draw(symbolToRender, at: coordinates)
        }
    }
    
    func draw(key: String, at coordinates: (CGFloat, CGFloat)) {
        let rect = CGRectMake(
            coordinates.0 - buttonOffset, coordinates.1 - buttonOffset, buttonSize, buttonSize)
        key.drawInRect(rect, withAttributes: attributes)
        
//        drawPoint(at: coordinates)
    }
    
    func drawPoint(at coordinates: (CGFloat, CGFloat)) {
        var path = UIBezierPath(rect: CGRectMake(coordinates.0, coordinates.1, 1, 1))
        UIColor.redColor().setStroke()
        path.stroke()
    }
    
    static func create(model: KeyboardModel) -> KeyboardView {
        var keyboardView = KeyboardView()
        keyboardView.backgroundColor = UIColor.darkGrayColor()
        keyboardView.initButtonAttributes()
        keyboardView.model = model
        return keyboardView
    }
}