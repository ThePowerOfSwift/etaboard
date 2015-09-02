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
        
        keyPressHandler = KeyPressHandler(
            inputViewController: self,
            model: keyboardModel)
        
        keyboardView = KeyboardView.create(keyboardModel)
        keyboardView?.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        self.view.addSubview(keyboardView!)
        keyboardModel.delegate = keyboardView
        
        let tapRecognizer = MyTapRecognizer(
            target: self, action: "handleTap:")
        keyboardView!.addGestureRecognizer(tapRecognizer)

    }
}
