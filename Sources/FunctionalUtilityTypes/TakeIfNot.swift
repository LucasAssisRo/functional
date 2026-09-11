// MARK: - TakeIfNot

/// A stored predicate that discards a source value when it matches.
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

/// A ``TakeIfNot`` whose predicate can throw.
public struct ThrowingTakeIfNot<Source, Failure: Error>: ~Copyable, Sendable {
  private let takeIfNot: @Sendable (_ source: Source) throws(Failure) -> Bool
  public init(takeIfNot: @escaping @Sendable (_ source: Source) throws(Failure) -> Bool) {
    self.takeIfNot = takeIfNot
  }

  public func callAsFunction(_ source: Source) throws(Failure) -> Source? {
    if try takeIfNot(source) {
      nil
    } else {
      source
    }
  }
}
