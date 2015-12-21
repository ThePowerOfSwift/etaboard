
class SystemDictionaryLoader {
    private var loaded = false
    
    func load(from inputController: UIInputViewController, into suggester: Suggester) {
        if loaded { return }
        
        inputController.requestSupplementaryLexiconWithCompletion { lexicon in
            let allEntries = lexicon.entries.map { $0.documentText }
            suggester.addUnknownLengths(allEntries)
            self.loaded = true
        }
    }
}