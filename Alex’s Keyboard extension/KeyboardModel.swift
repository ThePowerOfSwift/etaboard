import UIKit

protocol KeyboardModelDelegate {
    func keyboardChanged()
}

class KeyboardModel {
    static let Enter = "<cr>"
    static let Backspace = "<bs>"
    static let Space = "x3"
    static let NextKeyboard = "x4"
    static let Shift = "x5"
    
    let rows = [
        "\(Shift) \(Space) , . \(Backspace) \(Enter) \(NextKeyboard)",
        "q w e r t z u i o p ü",
        "a s d f g h j k l ö ä",
        "' y x c v b n m - ! ?",
        "1 2 3 4 5 6 7 8 9 0 ß",
    ]

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
        let noOfRowSegments = CGFloat(rows.count * 2)
        for (rowIdx, row) in enumerate(rows) {
            let y = size.height / noOfRowSegments * (CGFloat(rowIdx) * 2 + 1)

            let keysInRow = split(row) {$0 == " "}
            let numberOfKeySegments = CGFloat(keysInRow.count * 2)
            for (posInRow, key) in enumerate(keysInRow) {
                var x = size.width / numberOfKeySegments * (CGFloat(posInRow) * 2 + 1)
                lowercaseCoordinates[key] = (x, y)
                uppercaseCoordinates[toUppercase(key)] = (x, y)
            }
        }
    }

    private func toUppercase(key: String) -> String {
        if isNormalKey(key) { return key.uppercaseString }
        return key
    }

    private func isNormalKey(key: String) -> Bool {
        return count(key) == 1
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