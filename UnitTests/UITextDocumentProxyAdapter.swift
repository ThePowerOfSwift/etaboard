import UIKit

class UITextDocumentProxyAdapter: NSObject, UITextDocumentProxy {
    override init() {}
    
    // for UIKeyInput
    @objc func insertText(text: String) {}
    @objc func deleteBackward() {}
    @objc func hasText() -> Bool { return false }
    
    // for UITextInputTraits
    var autocapitalizationType = UITextAutocapitalizationType.None
    var autocorrectionType = UITextAutocorrectionType.Default
    var spellCheckingType = UITextSpellCheckingType.Default
    var enablesReturnKeyAutomatically = false
    var keyboardAppearance = UIKeyboardAppearance.Default
    var keyboardType = UIKeyboardType.Default
    var returnKeyType = UIReturnKeyType.Default
    // var secureTextEntry: Bool
    
    // for UITextDocumentProxy
    @objc var documentContextAfterInput: String?
    @objc var documentContextBeforeInput: String? { return nil }
    @objc func adjustTextPositionByCharacterOffset(offset: Int) {}
}


