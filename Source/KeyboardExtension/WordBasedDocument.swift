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
        guard let contextBefore = proxy.documentContextBeforeInput else { return nil }
        if contextBefore.hasSuffix(" ") { return nil }
        
        let wordsBefore = contextBefore.split(" ")
        return wordsBefore.last
    }
    
    func deleteCurrentWord() {
        guard let currentWord = currentWord() else { return }
        
        for _ in 0..<currentWord.characters.count {
            deleteBackward()
        }
    }
    
    func deleteBackward() {
        proxy.deleteBackward()
    }
    
    func insert(text: String) {
        proxy.insertText(text)
    }
}