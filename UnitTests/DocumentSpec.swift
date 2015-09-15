import Quick
import Nimble

class SomeTextDocumentProxy: UITextDocumentProxyAdapter {
    override func insertText(text: String) {
        expect(text).to(equal("foo"))
    }
}


class SomeSpec: QuickSpec {
    override func spec() {
        describe("Document") {
            it("passes string to proxy unchaged") {
                let document = Document(proxy: SomeTextDocumentProxy())
                document.insert("foo")
            }
        }
    }
}