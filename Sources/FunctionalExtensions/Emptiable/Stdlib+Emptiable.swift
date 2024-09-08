//
//  Stdlib+Emptiable.swift
//
//
//  Created by Lucas Assis Rodrigues on 5/12/24.
//

import FunctionalProtocols

// MARK: - String + Emptiable

extension String: Emptiable {}

// MARK: - Array + Emptiable

extension Array: Emptiable {}

// MARK: - Set + Emptiable

extension Set: Emptiable {}

// MARK: - Dictionary + Emptiable

extension Dictionary: Emptiable {}

// MARK: - CollectionOfOne + Emptiable

extension CollectionOfOne: Emptiable {}

// MARK: - EmptyCollection + Emptiable

extension EmptyCollection: Emptiable {}
