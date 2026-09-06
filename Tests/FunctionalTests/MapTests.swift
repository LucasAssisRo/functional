import Foundation
import FunctionalUtilityTypes
import Testing

struct `Map tests` {
    @Test func `map transforms the source`() {
        let map = Map<String, _>(\.isEmpty)
        #expect(map(""))
        #expect(map("not empty") == false)
    }

    @Test func `throwing map rethrows from the transformation`() {
        let throwingMap = ThrowingMap { (string: String) in
            try URL(string, strategy: .url)
        }

        #expect(throws: (any Error).self) { try throwingMap("") }
        #expect(throws: (any Error).self) { try throwingMap("not url") }
        #expect(throws: Never.self) { try throwingMap("https://www.test.com") }
    }
}
