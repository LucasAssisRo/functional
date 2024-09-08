//
//  Emptiable.swift
//
//
//  Created by Lucas Assis Rodrigues on 5/12/24.
//

// MARK: - Emptiable

public protocol Emptiable {
    var isEmpty: Bool { get }
}

extension Emptiable {
    public var isNotEmpty: Bool { !isEmpty }
}
