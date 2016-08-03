import UIKit

class MyTapRecognizer: UIGestureRecognizer {
    
    private var tapsExpected = 0
    private var tapsCollected = 0
    var lastTaps: [CGPoint] = []
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

        lastTaps = touches.map({ $0.locationInView(view) })
        debug("ended: touches at \(lastTaps)")
        tapsCollected += lastTaps.count
        
        if tapsCollected >= tapsExpected {
            debug("collected all taps")
            self.state = .Ended
        } else {
            debug("notifying about new tap")
            self.state = .Changed
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