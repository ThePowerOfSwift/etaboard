
class NotifyingDocument: Document {
    let wrappedDocument: Document
    var delegate: DocumentDelegate?
    
    init(wrapping wrappedDocument: Document) {
        self.wrappedDocument = wrappedDocument
    }
    
    func getToken() -> String? {
        return wrappedDocument.getToken()
    }
    
    func replaceToken(text: String) {
        wrappedDocument.replaceToken(text)
        notify()
    }
    
    func deleteBackward() {
        wrappedDocument.deleteBackward()
        notify()
    }
    
    func deleteToken() -> Bool {
        let wasDeleted = wrappedDocument.deleteToken()
        if wasDeleted { notify() }
        return wasDeleted
    }

    func insert(text: String) {
        wrappedDocument.insert(text)
        notify()
    }
    
    private func notify() {
        delegate?.didChangeCurrentWord(wrappedDocument.getToken())
    }
}