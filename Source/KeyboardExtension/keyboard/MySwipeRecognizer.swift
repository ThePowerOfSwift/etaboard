import UIKit

class MySwipeRecognizer: UIGestureRecognizer {
    var start: CGPoint = CGPointZero
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent) {
        NSLog("swipe recognizer")
        NSLog("  touchesBegan: #touches: \(event.allTouches()?.count)")
//        NSLog("  event: \(event)")
        if let allTouches = event.allTouches() {
            if allTouches.count > 1 {
                NSLog("  not a swipe")
                self.state = .Failed
            }
        }
        if let touch = touches.first {
            start = touch.locationInView(self.view)
            NSLog("  possible swipe began at (%.1f,%.1f)", start.x, start.y)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent) {
        NSLog("swipe recognizer")
        NSLog("  touchesEnded: #touches: \(event.allTouches()?.count)")
//        NSLog("  event: \(event)")
        if let touch = touches.first {
            let end = touch.locationInView(self.view)
            let xDistance = start.x - end.x
            if xDistance > 20 {
                NSLog("  swipe ended at (%.1f,%.1f)", end.x, end.y)
                NSLog("  start was at (%.1f,%.1f)", start.x, start.y)
                self.state = .Ended
            } else {
                NSLog("  not a swipe")
                self.state = .Failed
            }
        }
    }
    
    override func reset() {
        start = CGPointZero
    }
}