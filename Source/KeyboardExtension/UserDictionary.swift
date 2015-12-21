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
        let newDictionaryEntry = UserDictionaryEntry()
        newDictionaryEntry.word = word
        let realm = try Realm()
        try realm.write {
            realm.add(newDictionaryEntry, update: true)
        }
    }
}