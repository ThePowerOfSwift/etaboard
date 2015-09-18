
class KeyPressHandler {
    let keyboardViewController: KeyboardViewController
    let keyboard: KeyboardModel
    let document: Document
    var dedicatedReactions: [String: () -> Void]
    
    init(inputViewController: UIInputViewController,
        keyboard: KeyboardModel, document: Document) {
        self.keyboard = keyboard
        self.document = document
        let keyboardViewController = (inputViewController as! KeyboardViewController)
        self.keyboardViewController = keyboardViewController
        
        dedicatedReactions = [
            SchematicLayout.Enter: { document.insert("\n") },
            SchematicLayout.Backspace: { document.deleteBackward() },
            SchematicLayout.Space: { document.insert(" ") },
            SchematicLayout.NextSystemKeyboard: { inputViewController.advanceToNextInputMode() },
            
            SchematicLayout.ToUppercase: { keyboard.proceedToPage(.Uppercase) },
            SchematicLayout.ToLowercase: { keyboard.proceedToPage(.Lowercase) },
            SchematicLayout.ToSymbols: { keyboard.proceedToPage(.Symbols) },
            SchematicLayout.ToLetters: { keyboard.proceedToPage(.Lowercase) },
            SchematicLayout.ToEmojis: { keyboard.proceedToPage(.Emojis) },
        ]
    }
    
    func handle(key: String) {
        if let dedicatedReaction = dedicatedReactions[key] {
            dedicatedReaction()
        }
        else {
            document.insert(key)
            keyboard.proceedToPage(.Lowercase)
        }
    }
}