import XCTest
import Nimble

class SomeTextDocumentProxy: UITextDocumentProxyAdapter {
    override func insertText(text: String) {
        expect(text).to(equal("foo"))
    }
}


class DocumentTests: XCTestCase {
    
    func testPassesStringToProxyUnchanged() {
        let document = Document(proxy: SomeTextDocumentProxy())
        document.insert("foo")
    }

}