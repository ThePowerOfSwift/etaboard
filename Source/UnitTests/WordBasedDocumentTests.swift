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
        expect(self.document.deleteCurrentWord()) == true
        expect(self.mock.deleteBackward_calls) == 3
    }
    
    func testDeleteCurrentWord_DoesNothingAtTheBeginningOfDocument() {
        mock.documentContextBeforeInput = nil
        expect(self.document.deleteCurrentWord()) == false
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

// MARK: - deleteToken

extension WordBasedDocumentTests {
    func testDeleteToken_DoesNothingAtBeginningOfDocument() {
        mock.documentContextBeforeInput = nil
        expect(self.document.deleteToken()) == false
        expect(self.mock.deleteBackward_calls) == 0
    }
    
    func testRecognizesConsecutiveNonAlphanumericCharactersAsToken() {
        mock.documentContextBeforeInput = "foo"
        expect(self.document.deleteToken()) == true
        expect(self.mock.deleteBackward_calls) == 3
    }

    func testRecognizesConsecutiveSpacesAfterWordAsToken() {
        mock.documentContextBeforeInput = "a  "
        expect(self.document.deleteToken()) == true
        expect(self.mock.deleteBackward_calls) == 2
    }

    func testRecognizesConsecutivePunctuationAsToken() {
        mock.documentContextBeforeInput = "?!"
        expect(self.document.deleteToken()) == true
        expect(self.mock.deleteBackward_calls) == 2
    }
}
