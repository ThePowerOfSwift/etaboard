import UIKit

class Document {
    let proxy: UITextDocumentProxy
    
    init(proxy: UITextDocumentProxy) {
        self.proxy = proxy
    }
    
    func replaceCurrentWord(text: String) {
        deleteCurrentWord()
        insert(text)
    }
    
    func deleteCurrentWord() {
        if let contextBefore = proxy.documentContextBeforeInput {
            if contextBefore.hasSuffix(" ") { return }
            let wordsBefore = contextBefore.characters.split {$0 == " "}.map { String($0) }
            let lastWord = wordsBefore.last
            for _ in 0..<(lastWord!).characters.count {
                proxy.deleteBackward()
            }
        }
    }
    
    func insert(text: String) {
        proxy.insertText(text)
    }
}