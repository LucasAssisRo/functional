// MARK: - Functional

/// A type that gains scope functions for transforming, filtering and
/// configuring its instances inline.
public protocol Functional {}

extension Functional {
  /// Transforms the instance with a closure and returns its result.
  public func `let`<Tranformed, Failure: Error>(
    _ block: (Self) throws(Failure) -> Tranformed,
  ) throws(Failure) -> Tranformed {
    try block(self)
  }

  /// Returns the instance when it satisfies `block`, otherwise `nil`.
  public func takeIf(_ block: (Self) -> Bool) -> Self? {
    if block(self) {
      self
    } else {
      nil
    }
  }

  /// Returns the instance when it fails `block`, otherwise `nil`.
  public func takeIfNot(_ block: (Self) -> Bool) -> Self? {
    if block(self) == false {
      self
    } else {
      nil
    }
  }

  /// Runs `block` on the instance and returns it, so calls can be chained.
  public func also<Failure: Error>(_ block: (Self) throws(Failure) -> Void) throws(Failure) -> Self {
    try block(self)
    return self
  }

  /// Returns a copy of the instance with `keyPath` set to `value`.
  public func also<Property>(set keyPath: WritableKeyPath<Self, Property>, to value: Property) -> Self {
    var new = self
    new[keyPath: keyPath] = value
    return new
  }
}

// MARK: - Functional + AnyObject

extension Functional where Self: AnyObject {
  /// Runs `block` on the instance and returns it, so calls can be chained.
  public func also<Failure: Error>(_ block: (Self) throws(Failure) -> Void) throws(Failure) -> Self {
    try block(self)
    return self
  }

  /// Sets `keyPath` to `value` on the instance itself and returns it.
  public func also<Property>(set keyPath: ReferenceWritableKeyPath<Self, Property>, to value: Property) -> Self {
    self[keyPath: keyPath] = value
    return self
  }
}
