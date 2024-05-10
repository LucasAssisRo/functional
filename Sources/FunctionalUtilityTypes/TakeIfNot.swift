//
//  TakeIfNot.swift
//  
//
//  Created by Lucas Assis Rodrigues on 5/9/24.
//

// MARK: - TakeIfNot

public struct TakeIfNot<Source>: ~Copyable, Sendable {
    private let takeIfNot: @Sendable (_ source: Source) -> Bool
    public init(_ takeIfNot: @escaping @Sendable (_ source: Source) -> Bool) {
        self.takeIfNot = takeIfNot
    }

    public func callAsFunction(_ source: Source) -> Source? {
        if takeIfNot(source) {
            nil
        } else {
            source
        }
    }
}

// MARK: - ThrowingTakeIfNot

public struct ThrowingTakeIfNot<Source>: ~Copyable, Sendable {
    private let takeIfNot: @Sendable (_ source: Source) throws -> Bool
    public init(takeIfNot: @escaping @Sendable (_ source: Source) throws -> Bool) {
        self.takeIfNot = takeIfNot
    }

    public func callAsFunction(_ source: Source) throws -> Source? {
        if try takeIfNot(source) {
            nil
        } else {
            source
        }
    }
}
