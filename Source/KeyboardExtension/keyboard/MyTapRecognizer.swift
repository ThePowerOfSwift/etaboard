import UIKit

class MyTapRecognizer: UIGestureRecognizer {
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent) {
        if let touch = touches.first {
            let touchPoint = touch.locationInView(self.view)
            NSLog("touch began at (%.1f,%.1f)", touchPoint.x, touchPoint.y)
            self.state = .Ended
        }
    }
}