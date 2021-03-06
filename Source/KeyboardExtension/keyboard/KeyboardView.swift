import UIKit

class KeyboardView: UIView{
    var buttonSize: CGFloat = 0
    var buttonOffset: CGFloat = 0
    var attributes: [String: AnyObject]?
    
    var model: KeyboardModel?
    let representations = [
        SchematicLayout.Enter: "⏎",
        SchematicLayout.Backspace: "⌫",
        SchematicLayout.Space: "＿＿",
        SchematicLayout.NextSystemKeyboard: "⌨",
        SchematicLayout.ToUppercase: "⬆︎",
        SchematicLayout.ToLowercase: "⬆︎",
        SchematicLayout.ToSymbols: "⌥",
        SchematicLayout.ToLetters: "←",
        SchematicLayout.ToEmojis: "☺︎",
    ]
    
    func initButtonAttributes() {
        let font = UIFont.systemFontOfSize(UIFont.buttonFontSize())
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.alignment = NSTextAlignment.Center
        attributes = [
            NSForegroundColorAttributeName: UIColor.lightTextColor(),
            NSFontAttributeName: font,
            NSParagraphStyleAttributeName: paraStyle
        ]
        
        let maxWidth = "⌫".sizeWithAttributes(attributes).width
        
        buttonSize = max(maxWidth, font.pointSize + abs(font.descender))
        buttonOffset = buttonSize / 2

    }

    override func layoutSubviews() {
        NSLog("new bounds: \(NSStringFromCGRect(self.bounds))")
        model?.keyboardSize = CGSizeMake(self.bounds.width, self.bounds.height)
    }

    override func drawRect(rect: CGRect) {
        NSLog("drawing keyboard in rect: \(NSStringFromCGRect(rect))")

        for (key, coordinates) in model!.keysWithCoordinates() {
            draw(symbolToRender(key), at: coordinates)
        }
    }
    
    func symbolToRender (key: String) -> String {
        if let specialRepresentation = representations[key] {
            return specialRepresentation }
        return key
    }
    
    func draw(key: String, at coordinates: (CGFloat, CGFloat)) {
        let rect = CGRectMake(
            coordinates.0 - buttonOffset, coordinates.1 - buttonOffset, buttonSize, buttonSize)
        key.drawInRect(rect, withAttributes: attributes)
        
//        drawPoint(at: coordinates)
    }
    
    func drawPoint(at coordinates: (CGFloat, CGFloat)) {
        let path = UIBezierPath(rect: CGRectMake(coordinates.0, coordinates.1, 1, 1))
        UIColor.redColor().setStroke()
        path.stroke()
    }
    
    static func create(model: KeyboardModel) -> KeyboardView {
        let keyboardView = KeyboardView()
        keyboardView.backgroundColor = UIColor.darkGrayColor()
        keyboardView.initButtonAttributes()
        keyboardView.model = model
        return keyboardView
    }
}

// MARK: - KeyboardModelDelegate
extension KeyboardView: KeyboardModelDelegate {
    func keyboardChanged() {
        setNeedsDisplay()
        layer.displayIfNeeded()
    }
}