
class KeyPressHandler {
    let keyboardViewController: KeyboardViewController
    let input: UIKeyInput
    let model: KeyboardModel
    var dedicatedReactions: [String: () -> Void]
    
    init(inputViewController: UIInputViewController,
        model: KeyboardModel) {
        let input = inputViewController.textDocumentProxy as! UIKeyInput
        self.input = input
        self.model = model
        let keyboardViewController = (inputViewController as! KeyboardViewController)
        self.keyboardViewController = keyboardViewController
        
        dedicatedReactions = [
            KeyboardModel.Enter: { input.insertText("\n") },
            KeyboardModel.Backspace: { input.deleteBackward() },
            KeyboardModel.Space: { input.insertText(" ") },
            KeyboardModel.NextKeyboard: {
                inputViewController.advanceToNextInputMode() },
            KeyboardModel.Shift: {
                model.toggleUpperCase()
                keyboardViewController.keyboardView?.setNeedsDisplay()
            },
        ]
    }
    
    func redrawKeyboard() {
        
    }
    
    func handle(key: String) {
        if let dedicatedReaction = dedicatedReactions[key] {
            dedicatedReaction()
        }
        else {
            input.insertText(key)
            if model.typeInUpperCase {
                model.disableUpperCase()
                keyboardViewController.keyboardView?.setNeedsDisplay()
            }
        }

    }
}