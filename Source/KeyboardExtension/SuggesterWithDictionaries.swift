
class SuggesterWithDictionaries {
    static var systemLexiconLoaded = false
    static let instance = SuggesterWithDictionaries.createSuggester()
    
    class func createSuggester() -> Suggester {
        let suggester = Suggester()
        
        loadDictionaries(from: ".", with: suggester.addUnknownLengths)
        loadDictionaries(from: "de", with: suggester.addSameLength)
        
        return suggester
    }
    
    private static func loadDictionaries(from pathInBundle: String,
        with functor: [String] -> ()) {
            
        let bundlePath = "Dictionaries.bundle"
        let directory = NSURL.fileURLWithPathComponents([bundlePath, pathInBundle])?.path
        let paths = NSBundle.mainBundle().pathsForResourcesOfType("txt",
            inDirectory: directory)
        NSLog("paths: \(paths)")
        paths.forEach { path in
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                loadSuggestionsFromDictionaryAt(path) |> functor
            })
        }
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
}