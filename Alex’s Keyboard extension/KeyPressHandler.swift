
class KeyPressHandler {
    let input: UIKeyInput
    var dedicatedReactions: [String: () -> Void]
    
    init(input: UIKeyInput) {
        self.input = input
        dedicatedReactions = [
            KeyboardModel.Enter: { input.insertText("\n") },
            KeyboardModel.Backspace: { input.deleteBackward() },
            KeyboardModel.Space: { input.insertText(" ") },
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