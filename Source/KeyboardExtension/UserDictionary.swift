import Foundation
import RealmSwift

class UserDictionaryEntry: Object {
    dynamic var word = ""
    
    class func create(word: String) -> UserDictionaryEntry {
        let entry = UserDictionaryEntry()
        entry.word = word
        return entry
    }

    override static func primaryKey() -> String? {
        return "word"
    }
}

class UserDictionary {
    func loadWords() throws -> [String] {
        let realm = try Realm()
        let entries = realm.objects(UserDictionaryEntry)
        let words = entries.map { $0.word }
        return words
    }
    
    private func hasWord(word: String, realm: Realm) -> Bool {
        if let _ = realm.objectForPrimaryKey(UserDictionaryEntry.self, key: word) {
            return true
        }
        return false
    }
    
    func addWord(word: String) throws {
        let realm = try Realm()
        if hasWord(word, realm: realm) { return }

        let newDictionaryEntry = UserDictionaryEntry.create(word)
        try realm.write {
            realm.add(newDictionaryEntry)
            NSLog("adding new")
        }
    }
}