//
//  TakeIf.swift
//
//
//  Created by Lucas Assis Rodrigues on 5/9/24.
//

// MARK: - TakeIf

public struct TakeIf<Source>: ~Copyable, Sendable {
    private let takeIf: @Sendable (_ source: Source) -> Bool
    public init(_ takeIf: @escaping @Sendable (_ source: Source) -> Bool) {
        self.takeIf = takeIf
    }

    public func callAsFunction(_ source: Source) -> Source? {
        if takeIf(source) {
            source
        } else {
            nil
        }
    }
}

// MARK: - ThrowingTakeIf

public struct ThrowingTakeIf<Source>: ~Copyable, Sendable {
    private let takeIf: @Sendable (_ source: Source) throws -> Bool
    public init(takeIf: @escaping @Sendable (_ source: Source) throws -> Bool) {
        self.takeIf = takeIf
    }

    public func callAsFunction(_ source: Source) throws -> Source? {
        if try takeIf(source) {
            source
        } else {
            nil
        }
    }
}

