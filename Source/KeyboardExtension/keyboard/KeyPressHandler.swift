
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
                keyboard.proceedToPage(.Lowercase)
            },
            SchematicLayout.NextSystemKeyboard: nextKeyboardAction,
            SchematicLayout.ToLowercase: { keyboard.proceedToPage(.Lowercase) },
            SchematicLayout.ToSymbols: { keyboard.proceedToPage(.Symbols) },
            SchematicLayout.ToLetters: { keyboard.proceedToPage(.Lowercase) },
            SchematicLayout.ToEmojis: { keyboard.proceedToPage(.Emojis) },
        ]
            
        self.dedicatedReactions[SchematicLayout.ToUppercase] = {
            keyboard.proceedToPage(.Uppercase)
            mainStore.dispatch(CapitalizeSuggestionsAction())
        }
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