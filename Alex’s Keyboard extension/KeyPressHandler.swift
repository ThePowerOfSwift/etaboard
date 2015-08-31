
class KeyPressHandler {
    let input: UIKeyInput
    var dedicatedReactions: [String: () -> Void]
    
    init(inputViewController: UIInputViewController,
        model: KeyboardModel) {
        let input = inputViewController.textDocumentProxy as! UIKeyInput
        self.input = input
        
        dedicatedReactions = [
            KeyboardModel.Enter: { input.insertText("\n") },
            KeyboardModel.Backspace: { input.deleteBackward() },
            KeyboardModel.Space: { input.insertText(" ") },
            KeyboardModel.NextKeyboard: {
                inputViewController.advanceToNextInputMode() },
            KeyboardModel.Shift: { model.toggleUpperCase() },
        ]
    }
    
    func handle(key: String) {
        if let dedicatedReaction = dedicatedReactions[key] {
            dedicatedReaction()
        }
        else {
            input.insertText(key)
        }

    }
}