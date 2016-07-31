import UIKit

class MyTapRecognizer: UIGestureRecognizer {
    
    var taps = 0
    var tapLocations: [CGPoint] = []
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent) {
        if let allTouches = event.allTouches() {
            taps = allTouches.count
        }
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent) {
        if let touch = touches.first {
            let touchPoint = touch.locationInView(self.view)
            NSLog("tap ended: touch at \(NSStringFromCGPoint(touchPoint))")
            tapLocations.append(touchPoint)
            
            if tapLocations.count == taps {
                NSLog("collected all taps")
                self.state = .Ended
            }
        }
    }
    
    override func reset() {
        taps = 0
        tapLocations = []
    }
}