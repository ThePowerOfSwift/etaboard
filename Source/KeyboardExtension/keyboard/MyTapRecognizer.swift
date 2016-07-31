import UIKit

class MyTapRecognizer: UIGestureRecognizer {
    
    var taps = 0
    var tapLocations: [CGPoint] = []
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent) {
        if let allTouches = event.allTouches() {
            debug("began: #allTouches: \(allTouches.count)")
            taps = allTouches.count
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent) {
        debug("ended: #touches: \(touches.count)")
        debug("ended: #allTouches: \(event.allTouches()?.count)")

        if let touch = touches.first {
            let touchPoint = touch.locationInView(self.view)
            debug("ended: touch at \(NSStringFromCGPoint(touchPoint))")
            tapLocations.append(touchPoint)
            
            if tapLocations.count >= taps {
                debug("collected all taps")
                self.state = .Ended
            }
        }
    }
    
    override func reset() {
        debug("reset")
        taps = 0
        tapLocations = []
    }
    
    func debug(message: String) {
        #if DEBUG
            NSLog("[tap] \(message)")
        #endif
    }
}