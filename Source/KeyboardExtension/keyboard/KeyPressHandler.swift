
class KeyPressHandler {
    let keyboard: KeyboardModel
    let document: Document
    var dedicatedReactions: [String: () -> Void]
    
    init(nextKeyboardAction: () -> Void,
        keyboard: KeyboardModel, document: Document) {
        self.keyboard = keyboard
        self.document = document
            
        dedicatedReactions = [
            SchematicLayout.Enter: { document.insert("\n") },
            SchematicLayout.Backspace: { document.deleteBackward() },
            SchematicLayout.Space: {
                document.insert(" ")
                store.dispatch(DeactivateCapitalization())
            },
            SchematicLayout.NextSystemKeyboard: nextKeyboardAction,
            SchematicLayout.ToSymbols: { keyboard.proceedToPage(.Symbols) },
            SchematicLayout.ToLetters: { keyboard.proceedToPage(.Lowercase) },
            SchematicLayout.ToEmojis: { keyboard.proceedToPage(.Emojis) },
            
            SchematicLayout.ToLowercase: { store.dispatch(DeactivateCapitalization()) },
            SchematicLayout.ToUppercase: { store.dispatch(ActivateCapitalization()) }
        ]
    }
    
    func handle(key: String) {
        if let dedicatedReaction = dedicatedReactions[key] {
            dedicatedReaction()
        }
        else {
            document.insert(key)
            store.dispatch(DeactivateCapitalization())
        }
    }
}