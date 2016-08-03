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
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeLeft))
        leftSwipe.direction = .Left
        leftSwipe.delegate = self
        keyboardView.addGestureRecognizer(leftSwipe)

        let tap = MyTapRecognizer(target: self, action: #selector(didTap))
        tap.delegate = self
        keyboardView.addGestureRecognizer(tap)
        tap.requireGestureRecognizerToFail(leftSwipe)

        keyboardModel.delegate = keyboardView
        view = keyboardView
    }
 
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func didTap(recognizer: MyTapRecognizer) {
        NSLog("tap on keyboard at \(recognizer.lastTap)")
        recognizer.lastTap |> keyboardModel.closestKey |> keyPressHandler.handle
    }

    func didSwipeLeft(recognizer: UIGestureRecognizer) {
        NSLog("swipe left")
        document.deleteCurrentWord()
    }
}