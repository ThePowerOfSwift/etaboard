import UIKit

class KeyboardViewController: UIInputViewController {
    var keyboardView: KeyboardView?
    var keyboardModel = KeyboardModel()
    var keyPressHandler: KeyPressHandler?

    func handleTap(recognizer: UIGestureRecognizer) {
        let touchPoint = recognizer.locationInView(self.view)
        let key = keyboardModel.key(touchPoint)
        keyPressHandler?.handle(key)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.darkGrayColor()
        
        keyPressHandler = KeyPressHandler(inputViewController: self)
        
        keyboardView = KeyboardView.create(keyboardModel)
        self.view.addSubview(keyboardView!)
        
        let tapRecognizer = MyTapRecognizer(
            target: self, action: "handleTap:")
        keyboardView!.addGestureRecognizer(tapRecognizer)
    }
    
    override func viewWillLayoutSubviews() {
        NSLog("size: (%.1f,%.1f)", view.bounds.width, view.bounds.height)
        
        keyboardView!.frame = CGRectMake(0, 0, view.bounds.width, view.bounds.height)
        keyboardModel.keyboardSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height)
        keyboardView!.setNeedsDisplay()
    }
}
