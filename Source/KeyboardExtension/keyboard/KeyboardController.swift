import UIKit

class KeyboardController: UIViewController, UIGestureRecognizerDelegate {
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
        
        let tap = MyTapRecognizer(target: self, action: #selector(didTap))
        tap.delegate = self
        keyboardView.addGestureRecognizer(tap)
        
        keyboardModel.delegate = keyboardView
        view = keyboardView
    }
 
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func didTap(recognizer: UIGestureRecognizer) {
        let touchPoint = recognizer.locationInView(view)
        let intendedTouchPoint = CGPointMake(touchPoint.x, touchPoint.y)
        let key = keyboardModel.closestKey(to: intendedTouchPoint)
        keyPressHandler.handle(key)
    }
    
    func didSwipeLeft(recognizer: UIGestureRecognizer) {
        document.deleteCurrentWord()
    }
}