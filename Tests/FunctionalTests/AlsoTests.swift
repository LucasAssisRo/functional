import FunctionalUtilityTypes
import Testing

struct `Also tests` {
  @Test func `also mutates a copy of the target`() throws {
    let also = Also<Int> { $0 += 1 }
    let a = 1
    #expect(also(a) == 2)
    #expect(also(a) != 3)

    let throwingAlso = ThrowingAlso<Int> { $0 += 1 }
    #expect(throws: Never.self) { try throwingAlso(a) }

    struct TestError: Error, Equatable {}

    let alwaysThrow = ThrowingAlso<Int> { _ in throw TestError() }
    #expect(throws: TestError.self) { try alwaysThrow(a) }
  }
}
