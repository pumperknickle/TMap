import Foundation
import Nimble
import Quick
import Bedrock
@testable import TMap

final class TSetSpec: QuickSpec {
    override func spec() {
        let newMap = TSet<String>()
        let key1 = "foo"
        let key2 = "bar"
        let modifiedMap = newMap.adding(key1).adding(key2)
        it("should contain those keys") {
            expect(modifiedMap.contains(key1)).to(beTrue())
            expect(modifiedMap.contains(key2)).to(beTrue())
        }
        let deletedMap = modifiedMap.removing(key1)
        it("should not contain the deleted key") {
            expect(deletedMap.contains(key1)).toNot(beTrue())
        }
    }
}
