import UIKit

protocol KeyboardModelDelegate {
    func keyboardChanged()
}

class KeyboardModel {
    private var uppercaseCoordinates = [String: (CGFloat, CGFloat)]()
    private var lowercaseCoordinates = [String: (CGFloat, CGFloat)]()
    private var coordinates = [String: (CGFloat, CGFloat)]() {
        didSet {
            delegate?.keyboardChanged()
        }
    }

    var delegate: KeyboardModelDelegate?
    
    private var typeInUppercase = false {
        didSet {
            if typeInUppercase != oldValue {
                updateCoordinates()
            }
        }
    }

    var keyboardSize: CGSize {
        didSet {
            calculateCoordinates(keyboardSize)
            updateCoordinates()
        }
    }

    init() {
        self.keyboardSize = CGSize(width: 0, height: 0)
    }

    func keysWithCoordinates() -> [String: (CGFloat, CGFloat)] {
        let result = coordinates
        return result
    }

    private func calculateCoordinates(size: CGSize) {
        let rows = SchematicLayout.rowsLowercase
        let noOfRowSegments = CGFloat(rows.count * 2)
        for (rowIdx, row) in enumerate(rows) {
            let y = size.height / noOfRowSegments * (CGFloat(rowIdx) * 2 + 1)

            let keysInRow = split(row) {$0 == " "}
            let numberOfKeySegments = CGFloat(keysInRow.count * 2)
            for (posInRow, key) in enumerate(keysInRow) {
                var x = size.width / numberOfKeySegments * (CGFloat(posInRow) * 2 + 1)
                lowercaseCoordinates[key] = (x, y)
                uppercaseCoordinates[SchematicLayout.uppercase(forKey: key)] = (x, y)
            }
        }
    }

    private func updateCoordinates() {
        coordinates = typeInUppercase ? uppercaseCoordinates : lowercaseCoordinates
    }

    func key(tap: CGPoint) -> String {
        var keyForDistance = [CGFloat: String]()

        for (key, keyCoordinates) in coordinates {
            keyForDistance[distanceBetween(keyCoordinates, and: tap)] = key
        }
        return keyForDistance[minElement(keyForDistance.keys)]!
    }

    private func distanceBetween(pointA: (CGFloat, CGFloat), and: CGPoint) -> CGFloat {
        let dx = pointA.0 - and.x
        let dy = pointA.1 - and.y
        return sqrt(dx*dx + dy*dy)
    }
    
    func toggleUppercase() {
        typeInUppercase = !typeInUppercase
    }
    
    func disableUppercase() {
        typeInUppercase = false
    }
}