// MARK: - Also

/// A stored side effect that mutates a copy of its target and hands it back.
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

/// An ``Also`` whose mutation can throw.
public struct ThrowingAlso<Target, Failure: Error>: ~Copyable, Sendable {
  private let also: @Sendable (_ target: inout Target) throws(Failure) -> Void

  public init(_ also: @Sendable @escaping (_ target: inout Target) throws(Failure) -> Void) {
    self.also = also
  }

  public func callAsFunction(_ target: Target) throws(Failure) -> Target {
    var target = target
    try also(&target)
    return consume target
  }
}
