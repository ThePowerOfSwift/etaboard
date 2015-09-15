
class KeyPressHandler {
    let keyboardViewController: KeyboardViewController
    let input: UIKeyInput
    let model: KeyboardModel
    var dedicatedReactions: [String: () -> Void]
    
    init(inputViewController: UIInputViewController,
        model: KeyboardModel) {
        let input = inputViewController.textDocumentProxy as UIKeyInput
        self.input = input
        self.model = model
        let keyboardViewController = (inputViewController as! KeyboardViewController)
        self.keyboardViewController = keyboardViewController
        
        dedicatedReactions = [
            SchematicLayout.Enter: { input.insertText("\n") },
            SchematicLayout.Backspace: { input.deleteBackward() },
            SchematicLayout.Space: { input.insertText(" ") },
            SchematicLayout.NextSystemKeyboard: { inputViewController.advanceToNextInputMode() },
            
            SchematicLayout.ToUppercase: { model.proceedToPage(.Uppercase) },
            SchematicLayout.ToLowercase: { model.proceedToPage(.Lowercase) },
            SchematicLayout.ToSymbols: { model.proceedToPage(.Symbols) },
            SchematicLayout.ToLetters: { model.proceedToPage(.Lowercase) },
            SchematicLayout.ToEmojis: { model.proceedToPage(.Emojis) },
        ]
    }
    
    func handle(key: String) {
        if let dedicatedReaction = dedicatedReactions[key] {
            dedicatedReaction()
        }
        else {
            input.insertText(key)
            model.proceedToPage(.Lowercase)
        }
    }
}