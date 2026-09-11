// MARK: - Emptiable

/// A type that can report whether it holds no elements.
public protocol Emptiable {
  /// A Boolean value indicating whether the instance holds no elements.
  var isEmpty: Bool { get }
}

extension Emptiable {
  /// A Boolean value indicating whether the instance holds at least one element.
  public var isNotEmpty: Bool { isEmpty == false }
}
