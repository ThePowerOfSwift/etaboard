import UIKit

protocol KeyboardModelDelegate {
    func keyboardChanged()
}

class KeyboardModel {
    private var lowercaseLayout: ConcreteLayout?
    private var uppercaseLayout: ConcreteLayout?
    private var currentLayout: ConcreteLayout? {
        didSet {
            delegate?.keyboardChanged()
        }
    }

    var delegate: KeyboardModelDelegate?
    
    private var typeInUppercase = false {
        didSet {
            if typeInUppercase != oldValue {
                selectLayout()
            }
        }
    }

    var keyboardSize: CGSize? {
        didSet {
            calculateLayouts(keyboardSize!)
            selectLayout()
        }
    }

    
    func keysWithCoordinates() -> [String: (CGFloat, CGFloat)] {
        return currentLayout!.keysWithCoordinates
    }

    func closestKey(to tap: CGPoint) -> String {
        return currentLayout!.closestKey(to: tap)
    }
    
    private func calculateLayouts(size: CGSize) {
        lowercaseLayout = ConcreteLayout(
            schematicLayout: SchematicLayout.rowsLowercase, size: size)
        uppercaseLayout = ConcreteLayout(
            basedOn: lowercaseLayout!, transformer: SchematicLayout.uppercase)
    }

    private func selectLayout() {
        currentLayout = typeInUppercase ? uppercaseLayout : lowercaseLayout
    }

    func toggleUppercase() {
        typeInUppercase = !typeInUppercase
    }
    
    func disableUppercase() {
        typeInUppercase = false
    }
}