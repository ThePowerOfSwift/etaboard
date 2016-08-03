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
        view = keyboardView
        keyboardModel.delegate = keyboardView
        
        let leftSwipe = addSwipeRecognizer(.Left, action: #selector(didSwipeLeft))
        let upSwipe = addSwipeRecognizer(.Up, action: #selector(didSwipeUp))
        
        let tap = MyTapRecognizer(target: self, action: #selector(didTap))
        tap.delegate = self
        keyboardView.addGestureRecognizer(tap)
        tap.requireGestureRecognizerToFail(leftSwipe)
        tap.requireGestureRecognizerToFail(upSwipe)
    }
 
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    private func addSwipeRecognizer(direction: UISwipeGestureRecognizerDirection, action: Selector) -> UISwipeGestureRecognizer {
        let recognizer = UISwipeGestureRecognizer(target: self, action: action)
        recognizer.direction = direction
        recognizer.delegate = self
        view.addGestureRecognizer(recognizer)
        return recognizer
    }
    
    func didTap(recognizer: MyTapRecognizer) {
        NSLog("tap on keyboard at \(recognizer.lastTap)")
        recognizer.lastTap |> keyboardModel.closestKey |> keyPressHandler.handle
    }

    func didSwipeLeft(recognizer: UIGestureRecognizer) {
        NSLog("swipe left")
        document.deleteCurrentWord()
    }

    func didSwipeUp(recognizer: UIGestureRecognizer) {
        NSLog("swipe up")
        keyPressHandler.handle(SchematicLayout.ToUppercase)
    }
}