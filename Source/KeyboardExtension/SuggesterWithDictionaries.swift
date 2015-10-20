
class SuggesterWithDictionaries {
    static let instance = SuggesterWithDictionaries.createSuggester()
    
    class func createSuggester() -> Suggester {
        let suggester = Suggester()
        
        ["misc", "de", "top10000en"].forEach { dictionary in
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                loadSuggestionsFromDictionary(dictionary)
            })
        }
        
        return suggester
    }
    
    private static func loadSuggestionsFromDictionary(basename: String) {
        guard let path = NSBundle.mainBundle().pathForResource(basename, ofType: "txt") else {
            NSLog("could not find dictionary '\(basename)'")
            return
        }
        do {
            let dictionaryAsString = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            let words = dictionaryAsString.split("\n")
            addSuggestions(words, from: basename)
        } catch _ as NSError {
            NSLog("could not load dictionary from path \(path)")
        }
    }
    
    private static func addSuggestions(words: [String], from dictionary: String) {
        NSLog("entries in dictionary '\(dictionary)': \(words.count)")
        instance.add(words)
    }
}