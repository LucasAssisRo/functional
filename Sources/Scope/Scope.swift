// MARK: - Scope

public protocol Scope {}

public extension Scope {
    @inlinable
    @inline(__always)
    func `let`<Tranformed>(_ block: (Self) throws -> Tranformed) rethrows -> Tranformed { try block(self) }

    @inlinable
    @inline(__always)
    func takeIf(_ block: (Self) -> Bool) -> Self? { block(self) ? self : nil }

    @inlinable
    @inline(__always)
    func takeIfNot(_ block: (Self) -> Bool) -> Self? { !block(self) ? self : nil }

    @inlinable
    @inline(__always)
    mutating func also(_ block: (inout Self) throws -> Void) rethrows -> Self {
        try block(&self)
        return self
    }
}

// MARK: - Int + Scope

extension Int: Scope {}

// MARK: - Int64 + Scope

extension Int64: Scope {}

// MARK: - Double + Scope

extension Double: Scope {}

// MARK: - String + Scope

extension String: Scope {}

// MARK: - Array + Scope

extension Array: Scope {}

// MARK: - Dictionary + Scope

extension Dictionary: Scope {}

// MARK: - Result + Scope

extension Result: Scope {}
