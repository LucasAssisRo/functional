// MARK: - Map

/// A stored transformation from `Source` to `Transformed`.
public struct Map<Source, Transformed>: ~Copyable, Sendable {
  private let map: @Sendable (_ source: Source) -> Transformed

  public init(_ map: @escaping @Sendable (_ source: Source) -> Transformed) {
    self.map = map
  }

  public func callAsFunction(_ source: Source) -> Transformed {
    map(source)
  }
}

// MARK: - ThrowingMap

/// A ``Map`` whose transformation can throw.
public struct ThrowingMap<Source, Transformed>: ~Copyable, Sendable {
  private let map: @Sendable (_ source: Source) throws -> Transformed

  public init(_ map: @escaping @Sendable (_ source: Source) throws -> Transformed) {
    self.map = map
  }

  public func callAsFunction(_ source: Source) throws -> Transformed {
    try map(source)
  }
}
