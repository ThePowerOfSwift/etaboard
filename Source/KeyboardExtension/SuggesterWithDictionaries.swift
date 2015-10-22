
class SuggesterWithDictionaries {
    static var systemLexiconLoaded = false
    static let instance = SuggesterWithDictionaries.createSuggester()
    
    class func createSuggester() -> Suggester {
        let suggester = Suggester()
        
        ["misc", "de"].forEach { dictionary in
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                loadSuggestionsFromDictionary(dictionary)
            })
        }
        
        let paths = NSBundle.mainBundle().pathsForResourcesOfType("txt", inDirectory: "dictionaries.bundle")
        paths.forEach { path in
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                loadSuggestionsFromDictionaryAt(path)
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

    private static func loadSuggestionsFromDictionaryAt(path: String) {
        let basename = path.split("/").last
        do {
            let dictionaryAsString = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            let words = dictionaryAsString.split("\n")
            addSuggestions(words, from: basename)
        } catch _ as NSError {
            NSLog("could not load dictionary from path \(path)")
        }
    }

    static func addSuggestions(words: [String], from dictionary: String? = "<unknown>") {
        NSLog("entries in dictionary '\(dictionary!)': \(words.count)")
        instance.add(words)
        NSLog("suggester size: \(instance.size)")
    }
}