import UIKit

class WordBasedDocument: Document {
    let proxy: UITextDocumentProxy
    
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
            let wordsBefore = contextBefore.split(" ")
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
    }
}