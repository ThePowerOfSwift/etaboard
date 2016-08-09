import UIKit
import ReSwift

class KeyboardController: UIViewController, UIGestureRecognizerDelegate {
    private let keyboardModel = KeyboardModel()
    private let document: Document
    private let keyPressHandler: KeyPressHandler
    private let onSwipeDown: () -> ()
    private let onSwipeRight: () -> ()
    
    init(document: Document, nextKeyboardAction: () -> Void,
         onSwipeDown: () -> (),
         onSwipeRight: () -> ()
         ) {
        self.document = document
        keyPressHandler = KeyPressHandler(
            nextKeyboardAction: nextKeyboardAction,
            keyboard: keyboardModel,
            document: document)
        self.onSwipeDown = onSwipeDown
        self.onSwipeRight = onSwipeRight
        
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
        
        let tap = MyTapRecognizer(target: self, action: #selector(didTaps))
        tap.delegate = self
        keyboardView.addGestureRecognizer(tap)
        
        let swipes = [
            (UISwipeGestureRecognizerDirection.Left, #selector(didSwipeLeft)),
            (.Up, #selector(didSwipeUp)),
            (.Down, #selector(didSwipeDown)),
            (.Right, #selector(didSwipeRight))
        ]
        swipes.forEach { direction, action in
            let swipe = createSwipeRecognizer(direction, action)
            view.addGestureRecognizer(swipe)
            tap.requireGestureRecognizerToFail(swipe)
        }
    }
 
    private func createSwipeRecognizer(direction: UISwipeGestureRecognizerDirection, _ action: Selector) -> UISwipeGestureRecognizer {
        let recognizer = UISwipeGestureRecognizer(target: self, action: action)
        recognizer.direction = direction
        recognizer.delegate = self
        return recognizer
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    var counter = 0
    func didTaps(recognizer: MyTapRecognizer) {
        let taps = recognizer.getAndClearLastTaps()
        NSLog("processing taps: \(taps)")
        taps.forEach({ tap in
            NSLog("tap \(counter) on keyboard at \(tap)")
            counter += 1
            tap |> keyboardModel.closestKey |> keyPressHandler.handle
        })
    }

    func didSwipeLeft() {
        NSLog("swipe left")
        document.deleteToken()
    }
    func didSwipeUp() {
        NSLog("swipe up")
        store.dispatch(ActivateCapitalization())
    }
    func didSwipeDown() { onSwipeDown() }
    func didSwipeRight() { onSwipeRight() }
}

extension KeyboardController: StoreSubscriber {
    override func viewWillAppear(animated: Bool) {
        store.subscribe(self)
    }
    override func viewWillDisappear(animated: Bool) {
        store.unsubscribe(self)
    }
    func newState(state: AppState) {
        let nextLayout = state.capitalize ? Page.Uppercase : Page.Lowercase
        keyboardModel.proceedToPage(nextLayout)
    }
}
