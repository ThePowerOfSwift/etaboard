import UIKit

protocol KeyboardModelDelegate {
    func keyboardChanged()
}

class KeyboardModel {
    private var uppercaseLayout: ConcreteLayout?
    private var lowercaseLayout: ConcreteLayout?
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

    var keyboardSize: CGSize {
        didSet {
            calculateLayouts(keyboardSize)
            selectLayout()
        }
    }

    init() {
        self.keyboardSize = CGSize(width: 0, height: 0)
    }

    func keysWithCoordinates() -> [String: (CGFloat, CGFloat)] {
        return currentLayout!.keysWithCoordinates
    }

    private func calculateLayouts(size: CGSize) {
        var uppercase = [String: (CGFloat, CGFloat)]()
        var lowercase = [String: (CGFloat, CGFloat)]()
        
        let rows = SchematicLayout.rowsLowercase
        let noOfRowSegments = CGFloat(rows.count * 2)
        for (rowIdx, row) in enumerate(rows) {
            let y = size.height / noOfRowSegments * (CGFloat(rowIdx) * 2 + 1)

            let keysInRow = split(row) {$0 == " "}
            let numberOfKeySegments = CGFloat(keysInRow.count * 2)
            for (posInRow, key) in enumerate(keysInRow) {
                var x = size.width / numberOfKeySegments * (CGFloat(posInRow) * 2 + 1)
                lowercase[key] = (x, y)
                uppercase[SchematicLayout.uppercase(forKey: key)] = (x, y)
            }
        }
        lowercaseLayout = ConcreteLayout(layout: lowercase)
        uppercaseLayout = ConcreteLayout(layout: uppercase)
    }

    private func selectLayout() {
        currentLayout = typeInUppercase ? uppercaseLayout : lowercaseLayout
    }

    func closestKey(to tap: CGPoint) -> String {
        return currentLayout!.closestKey(to: tap)
    }

    func toggleUppercase() {
        typeInUppercase = !typeInUppercase
    }
    
    func disableUppercase() {
        typeInUppercase = false
    }
}