import UIKit

protocol KeyboardModelDelegate {
    func keyboardChanged()
}

enum Page {
    case Lowercase, Uppercase, Symbols
}

class KeyboardModel {
    private var currentPage = Page.Lowercase {
        didSet {
            if currentPage != oldValue { setCurrentLayout() }
        }
    }
    
    private var layouts = [Page: ConcreteLayout]()
    private var currentLayout: ConcreteLayout? {
        didSet {
            delegate?.keyboardChanged()
        }
    }

    var delegate: KeyboardModelDelegate?
    
    var keyboardSize: CGSize? {
        didSet {
            calculateLayouts(keyboardSize!)
            setCurrentLayout()
        }
    }

    
    func keysWithCoordinates() -> [String: (CGFloat, CGFloat)] {
        return currentLayout!.keysWithCoordinates
    }

    func closestKey(to tap: CGPoint) -> String {
        return currentLayout!.closestKey(to: tap)
    }
    
    private func calculateLayouts(size: CGSize) {
        layouts[.Lowercase] = ConcreteLayout(
            schematicLayout: SchematicLayout.Lowercase, size: size)
        layouts[.Uppercase] = ConcreteLayout(
            basedOn: layouts[.Lowercase]!, transformer: SchematicLayout.uppercase)
        layouts[.Symbols] = ConcreteLayout(
            schematicLayout: SchematicLayout.Symbols, size: size)
    }
    
    private func setCurrentLayout() {
        currentLayout = layouts[currentPage]
    }
    
    func proceedToPage(page: Page) {
        currentPage = page
    }
}