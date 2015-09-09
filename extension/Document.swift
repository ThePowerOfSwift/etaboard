
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
            var wordsBefore = split(contextBefore) {$0 == " "}
            let lastWord = wordsBefore.last
            for i in 0..<count(lastWord!) {
                proxy.deleteBackward()
            }
        }
    }
    
    func insert(text: String) {
        proxy.insertText(text)
    }
}