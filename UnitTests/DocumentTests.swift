import XCTest
import Nimble

class SomeTextDocumentProxy: UITextDocumentProxyAdapter {
    override func insertText(text: String) {
        expect(text).to(equal("foo"))
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
        let document = Document(proxy: SomeTextDocumentProxy())
        document.insert("foo")
    }
    
    func testDeleteCurrentWord_DeletesBackToLastSpaceExcludingTheSpace() {
        let mock = TextDocumentProxyWithTextBefore()
        let document = Document(proxy: mock)
        document.deleteCurrentWord()
        expect(mock.deleteBackwardCalled).to(equal(3))
    }

}