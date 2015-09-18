import UIKit

protocol DocumentDelegate {
    func didChangeCurrentWord(newCurrentWord: String)
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
    
    func deleteCurrentWord() {
        if let contextBefore = proxy.documentContextBeforeInput {
            if contextBefore.hasSuffix(" ") { return }
            let wordsBefore = contextBefore.characters.split {$0 == " "}.map { String($0) }
            let lastWord = wordsBefore.last
            for _ in 0..<(lastWord!).characters.count {
                deleteBackward()
            }
        }
    }
    
    func deleteBackward() {
        proxy.deleteBackward()
    }
    
    func insert(text: String) {
        proxy.insertText(text)
        delegate?.didChangeCurrentWord("foo")
    }
}