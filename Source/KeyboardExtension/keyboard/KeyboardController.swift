import UIKit

class KeyboardController: UIViewController {
    private let keyboardModel = KeyboardModel()
    private let document: Document
    private let keyPressHandler: KeyPressHandler
    
    init(document: Document, nextKeyboardAction: () -> Void) {
        self.document = document
        keyPressHandler = KeyPressHandler(
            nextKeyboardAction: nextKeyboardAction,
            keyboard: keyboardModel,
            document: document)
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let keyboardView = KeyboardView.create(keyboardModel)
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        
        let tapRecognizer = MyTapRecognizer(target: self, action: "handleTap:")
        keyboardView.addGestureRecognizer(tapRecognizer)
        
        keyboardModel.delegate = keyboardView
        
        view = keyboardView
    }
    
    func handleTap(recognizer: UIGestureRecognizer) {
        let touchPoint = recognizer.locationInView(view)
        let intendedTouchPoint = CGPointMake(touchPoint.x, touchPoint.y)
        let key = keyboardModel.closestKey(to: intendedTouchPoint)
        keyPressHandler.handle(key)
    }
}