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
        if contextBefore.hasSuffix(" ") || contextBefore.hasSuffix("\n") { return nil }
        
        let wordsBefore = contextBefore.split(" ")
        return wordsBefore.last
    }
    
    func deleteCurrentWord() -> Bool {
        guard let currentWord = currentWord() else { return false }
        
        for _ in 0..<currentWord.characters.count {
            deleteBackward()
        }
        return true
    }
    
    func deleteToken() -> Bool {
        guard let input = proxy.documentContextBeforeInput else { return false }
        NSLog("input: <\(input)>")
        
        let options: NSLinguisticTaggerOptions = []
        let schemes = [NSLinguisticTagSchemeLexicalClass]
        let tagger = NSLinguisticTagger(tagSchemes: schemes, options: Int(options.rawValue))
        let range = NSMakeRange(0, (input as NSString).length)
        tagger.string = input
        
        var tokens : [String] = []
        tagger.enumerateTagsInRange(
            range,
            scheme: NSLinguisticTagSchemeLexicalClass,
            options: options) {
                (tag, tokenRange, _, _) in
                let token = (input as NSString).substringWithRange(tokenRange)
                tokens.append(token)
        }
        NSLog("tokens: \(tokens)")
        
        guard let lastToken = tokens.last else { return true }
        
        for _ in 0..<lastToken.characters.count {
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