import UIKit

protocol KeyboardModelDelegate {
    func keyboardChanged()
}

class KeyboardModel {
    private var lowercaseLayout: ConcreteLayout?
    private var uppercaseLayout: ConcreteLayout?
    private var symbolsLayout: ConcreteLayout?
    
    private var currentLayoutIndex = 1 {
        didSet {
            if currentLayoutIndex != oldValue { setCurrentLayout() }
        }
    }
    
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
        lowercaseLayout = ConcreteLayout(
            schematicLayout: SchematicLayout.Lowercase, size: size)
        uppercaseLayout = ConcreteLayout(
            basedOn: lowercaseLayout!, transformer: SchematicLayout.uppercase)
        symbolsLayout = ConcreteLayout(
            schematicLayout: SchematicLayout.Symbols, size: size)
    }
    
    private func setCurrentLayout() {
        switch currentLayoutIndex {
        case 2: currentLayout = uppercaseLayout
        case 3: currentLayout = symbolsLayout
        default: currentLayout = lowercaseLayout
        }
    }

    func activateLettersPageLowercase() {
        currentLayoutIndex = 1
    }
    
    func activateLettersPageUppercase() {
        currentLayoutIndex = 2
    }
    
    func activateSymbolsPage() {
        currentLayoutIndex = 3
    }
}