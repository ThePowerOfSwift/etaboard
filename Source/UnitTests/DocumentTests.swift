import XCTest
import Nimble

class UITextDocumentProxyMock: UITextDocumentProxyAdapter {
    var insertTextCalledWith: String? = nil
    override func insertText(text: String) {
        insertTextCalledWith = text
    }
    
    var deleteBackwardCalled = 0
    override func deleteBackward() {
        deleteBackwardCalled++
    }
}


class DocumentTests: XCTestCase {

    var mock: UITextDocumentProxyMock!
    var document: Document!

    override func setUp() {
        mock = UITextDocumentProxyMock()
        document = Document(proxy: mock)
    }

    func testPassesStringToProxyUnchanged() {
        document.insert("foo")
        expect(self.mock.insertTextCalledWith).to(equal("foo"))
    }
    
    func testDeleteCurrentWord_DeletesBackToLastSpaceExcludingTheSpace() {
        mock.documentContextBeforeInput = "foo bar"
        document.deleteCurrentWord()
        expect(self.mock.deleteBackwardCalled).to(equal(3))
    }

}
