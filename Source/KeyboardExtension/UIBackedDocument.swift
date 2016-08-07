import UIKit

class UIBackedDocument: Document {
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
        if contextBefore.hasSuffix(" ") || contextBefore.hasSuffix("\n") { return nil }
        
        let wordsBefore = contextBefore.split(" ")
        return wordsBefore.last
    }
    
    func deleteCurrentWord() -> Bool {
        return delete(currentWord())
    }
    
    func deleteToken() -> Bool {
        guard let input = proxy.documentContextBeforeInput else { return false }
        NSLog("input: <\(input)>")
        
        let options: NSLinguisticTaggerOptions = []
        let scheme = NSLinguisticTagSchemeTokenType
        let tagger = NSLinguisticTagger(tagSchemes: [scheme], options: Int(options.rawValue))
        let range = NSMakeRange(0, input.characters.count)
        tagger.string = input
        
        var tokens: [String] = []
        tagger.enumerateTagsInRange(range, scheme: scheme, options: options) {
            (tag, tokenRange, _, _) in
                let token = (input as NSString).substringWithRange(tokenRange)
                tokens.append(token)
        }
        NSLog("tokens: \(tokens)")
        
        return delete(tokens.last)
    }
    
    private func delete(string: String?) -> Bool {
        guard let string = string else { return false }
        
        for _ in 0..<string.characters.count {
            deleteBackward()
        }
        return true
    }
    
    func deleteBackward() {
        proxy.deleteBackward()
    }
    
    func insert(text: String) {
        proxy.insertText(text)
    }
}