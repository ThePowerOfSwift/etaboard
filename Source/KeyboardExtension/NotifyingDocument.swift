
class NotifyingDocument: Document {
    let wrappedDocument: Document
    var delegate: DocumentDelegate?
    
    init(wrapping wrappedDocument: Document) {
        self.wrappedDocument = wrappedDocument
    }
    
    func currentWord() -> String? {
        return wrappedDocument.currentWord()
    }
    
    func replaceCurrentWord(text: String) {
        wrappedDocument.replaceCurrentWord(text)
        notify()
    }
    
    func deleteBackward() {
        wrappedDocument.deleteBackward()
        notify()
    }
    
    func deleteCurrentWord() -> Bool {
        let wasDeleted = wrappedDocument.deleteCurrentWord()
        if wasDeleted { notify() }
        return wasDeleted
    }
    
    func insert(text: String) {
        wrappedDocument.insert(text)
        notify()
    }
    
    private func notify() {
        delegate?.didChangeCurrentWord(wrappedDocument.currentWord())
    }
}