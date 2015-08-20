import UIKit

class KeyboardModel {
    var keyboardSize = CGSize(width: 0, height: 0)
    
    func distanceBetween(pointA: (CGFloat, CGFloat), pointB: (CGFloat, CGFloat)) -> CGFloat {
        let dx = pointA.0 - pointB.0
        let dy = pointA.1 - pointB.1
        return sqrt(dx*dx + dy*dy)
    }
    
    func key(tap: CGPoint) -> String {
        var ax = keyboardSize.width / 4
        var ay = keyboardSize.height / 4
        var lx = keyboardSize.width / 4 * 3
        var ly = keyboardSize.height / 4 * 3
        
        var keyForDistance = [CGFloat: String]()
        keyForDistance[distanceBetween((ax, ay), pointB: (tap.x, tap.y))] = "a"
        keyForDistance[distanceBetween((lx, ly), pointB: (tap.x, tap.y))] = "l"
        
        return keyForDistance[minElement(keyForDistance.keys)]!
    }
}