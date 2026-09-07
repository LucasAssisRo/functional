// MARK: - Emptiable

/// A type that can report whether it holds no elements.
public protocol Emptiable {
  /// A Boolean value indicating whether the instance holds no elements.
  var isEmpty: Bool { get }
}

public extension Emptiable {
  /// A Boolean value indicating whether the instance holds at least one element.
  var isNotEmpty: Bool { isEmpty == false }
}
