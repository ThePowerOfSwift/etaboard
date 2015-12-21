import RealmSwift
import PromiseKit

class UserDictionaryEntry: Object {
    dynamic var word = ""
    override static func primaryKey() -> String? {
        return "word"
    }
}


class SuggesterWithDictionaries {
    static var systemLexiconLoaded = false
    static let instance = SuggesterWithDictionaries.createSuggester()
    
    class func createSuggester() -> Suggester {
        let suggester = Suggester()
        
        getPathsOfWordLists(from: "." ).forEach(loadWordList(with: suggester.addUnknownLengths))
        getPathsOfWordLists(from: "de").forEach(loadWordList(with: suggester.addSameLength))
        
        dispatch_promise { try loadUserDictionary() }
            .thenInBackground(suggester.addUnknownLengths)
        
        return suggester
    }

    private static func loadUserDictionary() throws -> [String] {
        let realm = try Realm()
        let entries = realm.objects(UserDictionaryEntry)
        let words = entries.map { $0.word }
        return words
    }

    private static func loadWordList(with functor: [String] -> ()) -> (String -> ()) {
        return { path in
            dispatch_promise { try loadWordsAt(path) }.thenInBackground(functor)
        }
    }
    
    private static func getPathsOfWordLists(from pathInBundle: String) -> [String] {
        let bundlePath = "Dictionaries.bundle"
        let directory = NSURL.fileURLWithPathComponents([bundlePath, pathInBundle])?.path
        let paths = NSBundle.mainBundle().pathsForResourcesOfType("txt",
            inDirectory: directory)
        return paths
    }

    private static func loadWordsAt(path: String) throws -> [String] {
        let dictionaryAsString = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
        let words = dictionaryAsString.split("\n")
        return words
    }
}