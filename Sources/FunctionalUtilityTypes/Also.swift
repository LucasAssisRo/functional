//
//  Also.swift
//
//
//  Created by Lucas Assis Rodrigues on 5/9/24.
//

// MARK: - Also

public struct Also<Target>: ~Copyable, Sendable {
    private let also: @Sendable (_ target: inout Target) -> Void

    public init(_ also: @Sendable @escaping (_ target: inout Target) -> Void) {
        self.also = also
    }

    public func callAsFunction(_ target: Target) -> Target {
        var target = target
        also(&target)
        return consume target
    }
}

// MARK: - ThrowingAlso

public struct ThrowingAlso<Target>: ~Copyable, Sendable {
    private let also: @Sendable (_ target: inout Target) throws -> Void

    public init(_ also: @Sendable @escaping (_ target: inout Target) throws -> Void) {
        self.also = also
    }

    public func callAsFunction(_ target: Target) throws -> Target {
        var target = target
        try also(&target)
        return consume target
    }
}
