import UIKit

class KeyboardModel {
    var coordinates = [String: (CGFloat, CGFloat)]()

    var keyboardSize: CGSize {
        get {
            // this is crap
            return self.keyboardSize
        }
        set(newSize) {
            var row = "a s d f"
            var keys = split(row) {$0 == " "}
            var numberOfSegments = CGFloat(keys.count * 2)
            var y = newSize.height / 2
            
            for (posInRow, key) in enumerate(keys) {
                var x = newSize.width / numberOfSegments * (CGFloat(posInRow) * 2 + 1)
                coordinates[key] = (x, y)
            }
        }
    }

    init() {
        self.keyboardSize = CGSize(width: 0, height: 0)
    }

    
    func keysWithCoordinates() -> [String: (CGFloat, CGFloat)] {
        return coordinates
    }
    
    func distanceBetween(pointA: (CGFloat, CGFloat), and: CGPoint) -> CGFloat {
        let dx = pointA.0 - and.x
        let dy = pointA.1 - and.y
        return sqrt(dx*dx + dy*dy)
    }
    
    func key(tap: CGPoint) -> String {
        var keyForDistance = [CGFloat: String]()
        
        for (key, keyCoordinates) in coordinates {
            keyForDistance[distanceBetween(keyCoordinates, and: tap)] = key
        }
        
        return keyForDistance[minElement(keyForDistance.keys)]!
    }
}