import RealmSwift

class UserDictionaryEntry: Object {
    dynamic var word = ""
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
    
    func addWord(word: String) throws {
        let realm = try Realm()
        if let _ = realm.objectForPrimaryKey(UserDictionaryEntry.self, key: word) {
            return
        }

        let newDictionaryEntry = UserDictionaryEntry()
        newDictionaryEntry.word = word
        try realm.write {
            realm.add(newDictionaryEntry)
        }
    }
}