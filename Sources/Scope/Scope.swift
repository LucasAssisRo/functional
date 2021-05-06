// MARK: - Scope

public protocol Scope {}

public extension Scope {
    @inlinable
    @inline(__always)
    func `let`<Tranformed>(_ block: (Self) throws -> Tranformed) rethrows -> Tranformed { try block(self) }
}

public extension Scope where Self: AnyObject {
    @inlinable
    @inline(__always)
    func apply(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }
}

// MARK: - Functional

public protocol Functional {}

public extension Functional {
    func takeIf(_ block: (Self) -> Bool) -> Self? { block(self) ? self : nil }
    func takeIfNot(_ block: (Self) -> Bool) -> Self? { !block(self) ? self : nil }
}

// MARK: - Int + Functional

extension Int: Functional {}

// MARK: - Int64 + Functional

extension Int64: Functional {}

// MARK: - Double + Functional

extension Double: Functional {}

// MARK: - String + Functional

extension String: Functional {}

// MARK: - Array + Functional

extension Array: Functional {}

// MARK: - Dictionary + Functional

extension Dictionary: Functional {}

// MARK: - Result + Functional

extension Result: Functional {}

#if canImport(Foundation)
    import Foundation

    // MARK: - NSObject + Functional

    extension NSObject: Functional {}
#endif

#if canImport(UIKit)
    import UIKit

    // MARK: - CGFloat + Functional

    extension CGFloat: Functional {}

    // MARK: - CGSize + Functional

    extension CGSize: Functional {}

    // MARK: - CGRect + Functional

    extension CGRect: Functional {}
#endif
