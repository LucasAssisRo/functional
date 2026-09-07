import Foundation
import FunctionalUtilityTypes
import Testing

struct `Take if tests` {
  @Test func `take if keeps matching strings`() throws {
    let takeIf = TakeIf<String>(\.isEmpty)
    #expect(takeIf("") != nil)
    #expect(takeIf("not empty") == nil)

    let throwingTakeIf = ThrowingTakeIf { (string: String) in
      try URL(string, strategy: .url).isFileURL
    }

    #expect(throws: (any Error).self) { try throwingTakeIf("") }
    #expect(throws: (any Error).self) { try throwingTakeIf("not url") }
    #expect(throws: Never.self) { try throwingTakeIf("https://www.test.com") }
    try #expect(throwingTakeIf("https://www.test.com") == nil)
  }

  @Test func `take if not discards matching strings`() throws {
    let takeIfNot = TakeIfNot<String>(\.isEmpty)
    #expect(takeIfNot("") == nil)
    #expect(takeIfNot("not empty") != nil)

    let throwingTakeIfNot = ThrowingTakeIfNot { (string: String) in
      try URL(string, strategy: .url).isFileURL
    }

    #expect(throws: (any Error).self) { try throwingTakeIfNot("") }
    #expect(throws: (any Error).self) { try throwingTakeIfNot("not url") }
    #expect(throws: Never.self) { try throwingTakeIfNot("https://www.test.com") }
    try #expect(throwingTakeIfNot("https://www.test.com") != nil)
  }
}
