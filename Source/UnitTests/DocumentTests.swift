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

    func testPassesStringToProxyUnchanged() {
        let mock = UITextDocumentProxyMock()
        let document = Document(proxy: mock)
        document.insert("foo")
        expect(mock.insertTextCalledWith).to(equal("foo"))
    }
    
    func testDeleteCurrentWord_DeletesBackToLastSpaceExcludingTheSpace() {
        let mock = UITextDocumentProxyMock()
        mock.documentContextBeforeInput = "foo bar"
        let document = Document(proxy: mock)
        document.deleteCurrentWord()
        expect(mock.deleteBackwardCalled).to(equal(3))
    }

}