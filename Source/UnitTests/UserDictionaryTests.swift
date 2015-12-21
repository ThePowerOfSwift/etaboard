import XCTest
import Nimble
import RealmSwift

class UserDictionaryTests: XCTestCase {
    private let userDictionary = UserDictionary()
    override func setUp() {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
    }
    
    func testAddsOneWord() {
        try! userDictionary.addWord("foo")
        expect(try self.userDictionary.loadWords()).to(contain("foo"))
    }

    func testAddsMultipleWords() {
        try! userDictionary.addWord("foo")
        try! userDictionary.addWord("bar")
        expect(try self.userDictionary.loadWords()).to(contain("foo", "bar"))
    }

    func testSafelyAddsSameWordMultipleTimes() {
        try! userDictionary.addWord("foo")
        try! userDictionary.addWord("foo")
    }
}