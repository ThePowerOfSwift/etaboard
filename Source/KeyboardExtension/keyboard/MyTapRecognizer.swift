import UIKit

class MyTapRecognizer: UIGestureRecognizer {
    
    private var tapsExpected = 0
    private var tapsCollected = 0
    var lastTap: CGPoint = CGPointMake(0, 0)
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent) {
        if let allTouches = event.allTouches() {
            debug("began: #allTouches: \(allTouches.count)")
            tapsExpected = allTouches.count
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent) {
        debug("ended: #touches: \(touches.count)")
        debug("ended: #allTouches: \(event.allTouches()?.count)")

        if let touch = touches.first {
            lastTap = touch.locationInView(self.view)
            debug("ended: touch at \(NSStringFromCGPoint(lastTap))")
            tapsCollected += 1
            
            if tapsCollected >= tapsExpected {
                debug("collected all taps")
                self.state = .Ended
            } else {
                self.state = .Changed
            }
        }
    }
    
    override func reset() {
        debug("reset")
        tapsExpected = 0
        tapsCollected = 0
    }
    
    private func debug(message: String) {
        #if DEBUG
            NSLog("[tap] \(message)")
        #endif
    }
}