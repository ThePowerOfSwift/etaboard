import UIKit

protocol DocumentDelegate {
    func didChangeCurrentWord(newCurrentWord: String?)
}

class Document {
    let proxy: UITextDocumentProxy
    var delegate: DocumentDelegate?
    
    init(proxy: UITextDocumentProxy) {
        self.proxy = proxy
    }
    
    func replaceCurrentWord(text: String) {
        deleteCurrentWord()
        insert(text)
    }
    
    func currentWord() -> String? {
        if let contextBefore = proxy.documentContextBeforeInput {
            if contextBefore.hasSuffix(" ") { return nil }
            let wordsBefore = contextBefore.componentsSeparatedByString(" ")
            return wordsBefore.last
        }
        return nil
    }
    
    func deleteCurrentWord() {
        if let currentWord = currentWord() {
            for _ in 0..<currentWord.characters.count {
                deleteBackward()
            }
        }
    }
    
    func deleteBackward() {
        proxy.deleteBackward()
    }
    
    func insert(text: String) {
        proxy.insertText(text)
        delegate?.didChangeCurrentWord(currentWord())
    }
}