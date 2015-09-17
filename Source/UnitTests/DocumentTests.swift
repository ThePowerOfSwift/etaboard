import XCTest
import Nimble

class SomeTextDocumentProxy: UITextDocumentProxyAdapter {
    var insertTextCalledWith: String? = nil
    override func insertText(text: String) {
        insertTextCalledWith = text
    }
}

class TextDocumentProxyWithTextBefore: UITextDocumentProxyAdapter {
    @objc override var documentContextBeforeInput: String? { return "foo bar" }
    
    var deleteBackwardCalled = 0
    
    override func deleteBackward() {
        deleteBackwardCalled++
    }
}


class DocumentTests: XCTestCase {
    
    func testPassesStringToProxyUnchanged() {
        let mock = SomeTextDocumentProxy()
        let document = Document(proxy: mock)
        document.insert("foo")
        expect(mock.insertTextCalledWith).to(equal("foo"))
    }
    
    func testDeleteCurrentWord_DeletesBackToLastSpaceExcludingTheSpace() {
        let mock = TextDocumentProxyWithTextBefore()
        let document = Document(proxy: mock)
        document.deleteCurrentWord()
        expect(mock.deleteBackwardCalled).to(equal(3))
    }

}