import Quick
import Nimble

class SomeSpec: QuickSpec {
    override func spec() {
        describe("The Thing") {
            it("does something") {
                expect(1+1).to(equal(2))
            }
        }
    }
}