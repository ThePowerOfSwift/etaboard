import UIKit

protocol KeyboardModelDelegate {
    func keyboardChanged()
}

class KeyboardModel {
    private var uppercaseLayout = [String: (CGFloat, CGFloat)]()
    private var lowercaseLayout = [String: (CGFloat, CGFloat)]()
    private var currentLayout = [String: (CGFloat, CGFloat)]() {
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
        let result = currentLayout
        return result
    }

    private func calculateLayouts(size: CGSize) {
        let rows = SchematicLayout.rowsLowercase
        let noOfRowSegments = CGFloat(rows.count * 2)
        for (rowIdx, row) in enumerate(rows) {
            let y = size.height / noOfRowSegments * (CGFloat(rowIdx) * 2 + 1)

            let keysInRow = split(row) {$0 == " "}
            let numberOfKeySegments = CGFloat(keysInRow.count * 2)
            for (posInRow, key) in enumerate(keysInRow) {
                var x = size.width / numberOfKeySegments * (CGFloat(posInRow) * 2 + 1)
                lowercaseLayout[key] = (x, y)
                uppercaseLayout[SchematicLayout.uppercase(forKey: key)] = (x, y)
            }
        }
    }

    private func selectLayout() {
        currentLayout = typeInUppercase ? uppercaseLayout : lowercaseLayout
    }

    func closestKey(to tap: CGPoint) -> String {
        var keyForDistance = [CGFloat: String]()

        for (key, keyCenter) in currentLayout {
            keyForDistance[distanceBetween(keyCenter, and: tap)] = key
        }
        return keyForDistance[minElement(keyForDistance.keys)]!
    }

    private func distanceBetween(pointA: (CGFloat, CGFloat), and pointB: CGPoint) -> CGFloat {
        let dx = pointA.0 - pointB.x
        let dy = pointA.1 - pointB.y
        return sqrt(dx*dx + dy*dy)
    }
    
    func toggleUppercase() {
        typeInUppercase = !typeInUppercase
    }
    
    func disableUppercase() {
        typeInUppercase = false
    }
}