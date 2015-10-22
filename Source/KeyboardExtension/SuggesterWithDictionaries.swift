
class SuggesterWithDictionaries {
    static var systemLexiconLoaded = false
    static let instance = SuggesterWithDictionaries.createSuggester()
    
    class func createSuggester() -> Suggester {
        let suggester = Suggester()
        
        let paths = NSBundle.mainBundle().pathsForResourcesOfType("txt", inDirectory: "Dictionaries.bundle")
        NSLog("paths: \(paths)")
        paths.forEach { path in
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                loadSuggestionsFromDictionaryAt(path) |> instance.add
            })
        }

        let de_paths = NSBundle.mainBundle().pathsForResourcesOfType("txt", inDirectory: "Dictionaries.bundle/de")
        NSLog("de paths: \(de_paths)")
        de_paths.forEach { path in
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                loadSuggestionsFromDictionaryAt(path) |> instance.addSameLength
            })
        }

        return suggester
    }
    
    private static func loadSuggestionsFromDictionaryAt(path: String) -> [String] {
        do {
            let dictionaryAsString = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            let words = dictionaryAsString.split("\n")
            return words
        } catch _ as NSError {
            NSLog("could not load dictionary from path \(path)")
            return []
        }
    }

    static func addSuggestions(words: [String]) {
        instance.add(words)
        NSLog("suggester size: \(instance.size)")
    }
}