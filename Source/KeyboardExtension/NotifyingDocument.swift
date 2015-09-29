
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
    }
    
    func deleteBackward() {
        wrappedDocument.deleteBackward()
    }
    
    func insert(text: String) {
        wrappedDocument.insert(text)
        delegate?.didChangeCurrentWord(wrappedDocument.currentWord())
    }
}