import UIKit

class MySwipeRecognizer: UIGestureRecognizer {
    var start: CGPoint = CGPointZero
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent) {
//        NSLog("swipe began: #touches: \(touches.count)")
//        NSLog("swipe began: event: #allTouches: \(event.allTouches()?.count)")
//        NSLog("  event: \(event)")
        if let allTouches = event.allTouches() {
            if allTouches.count > 1 {
//                NSLog("swipe began: not a swipe (#allTouches > 1)")
                self.state = .Failed
            }
        }
        if let touch = touches.first {
            start = touch.locationInView(self.view)
//            NSLog("swipe began: touch #1 at (%.1f,%.1f)", start.x, start.y)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent) {
//        NSLog("swipe ended: #touches: \(touches.count)")
//        NSLog("swipe ended: event: #allTouches: \(event.allTouches()?.count)")
//        NSLog("  event: \(event)")
        if let touch = touches.first {
            let end = touch.locationInView(self.view)
            let xDistance = start.x - end.x
            if xDistance > 20 {
//                NSLog("swipe ended: touch #1 at (%.1f,%.1f)", end.x, end.y)
//                NSLog("swipe ended: start was at (%.1f,%.1f)", start.x, start.y)
                self.state = .Ended
            } else {
//                NSLog("swipe ended: not a swipe")
                self.state = .Failed
            }
        }
    }
    
    override func reset() {
        start = CGPointZero
    }
    
}