import XCTest
import Nimble
import UIKit

class UITextDocumentProxyMock: UITextDocumentProxyAdapter {
    var insertText_calledWith: String? = nil
    override func insertText(text: String) {
        insertText_calledWith = text
    }
    
    var deleteBackward_calls = 0
    override func deleteBackward() {
        deleteBackward_calls += 1
    }
}


class WordBasedDocumentTests: XCTestCase {

    var mock: UITextDocumentProxyMock!
    var document: WordBasedDocument!

    override func setUp() {
        mock = UITextDocumentProxyMock()
        document = WordBasedDocument(proxy: mock)
    }

    func testPassesStringToProxyUnchanged() {
        document.insert("foo")
        expect(self.mock.insertText_calledWith) == "foo"
    }
    
    func testDeleteCurrentWord_DeletesBackToLastSpaceExcludingTheSpace() {
        mock.documentContextBeforeInput = "foo bar"
        document.deleteCurrentWord()
        expect(self.mock.deleteBackward_calls) == 3
    }
    
    func testDeleteCurrentWord_DoesNothingAtTheBeginningOfDocument() {
        mock.documentContextBeforeInput = nil
        document.deleteCurrentWord()
        expect(self.mock.deleteBackward_calls) == 0
    }
    
    func testDeleteCurrentWord_DoesNothingRightAfterSpace() {
        mock.documentContextBeforeInput = " "
        document.deleteCurrentWord()
        expect(self.mock.deleteBackward_calls) == 0
    }
    
    func testThereIsNoCurrentWordAtBeginningOfLine() {
        mock.documentContextBeforeInput = "\n"
        expect(self.document.currentWord()).to(beNil())
    }

}
