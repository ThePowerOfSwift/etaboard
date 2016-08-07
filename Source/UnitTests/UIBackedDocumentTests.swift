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


class UIBackedDocumentTests: XCTestCase {

    var mock: UITextDocumentProxyMock!
    var document: UIBackedDocument!

    override func setUp() {
        mock = UITextDocumentProxyMock()
        document = UIBackedDocument(proxy: mock)
    }

    func testPassesStringToProxyUnchanged() {
        document.insert("foo")
        expect(self.mock.insertText_calledWith) == "foo"
    }
}

// MARK: - getToken

extension UIBackedDocumentTests {
    func testThereIsNoTokenAtBeginningOfLine() {
        mock.documentContextBeforeInput = "\n"
        expect(self.document.getToken()).to(beNil())
    }
}

// MARK: - deleteToken

extension UIBackedDocumentTests {
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
