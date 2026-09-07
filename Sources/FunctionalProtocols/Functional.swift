// MARK: - Functional

/// A type that gains scope functions for transforming, filtering and
/// configuring its instances inline.
public protocol Functional {}

public extension Functional {
  /// Transforms the instance with a closure and returns its result.
  func `let`<Tranformed>(_ block: (Self) throws -> Tranformed) rethrows -> Tranformed {
    try block(self)
  }

  /// Returns the instance when it satisfies `block`, otherwise `nil`.
  func takeIf(_ block: (Self) -> Bool) -> Self? {
    if block(self) {
      self
    } else {
      nil
    }
  }

  /// Returns the instance when it fails `block`, otherwise `nil`.
  func takeIfNot(_ block: (Self) -> Bool) -> Self? {
    if block(self) == false {
      self
    } else {
      nil
    }
  }

  /// Runs `block` on the instance and returns it, so calls can be chained.
  func also(_ block: (Self) throws -> Void) rethrows -> Self {
    try block(self)
    return self
  }

  /// Returns a copy of the instance with `keyPath` set to `value`.
  func also<Property>(set keyPath: WritableKeyPath<Self, Property>, to value: Property) -> Self {
    var new = self
    new[keyPath: keyPath] = value
    return new
  }
}

// MARK: - Functional + AnyObject

public extension Functional where Self: AnyObject {
  /// Runs `block` on the instance and returns it, so calls can be chained.
  func also(_ block: (Self) throws -> Void) rethrows -> Self {
    try block(self)
    return self
  }

  /// Sets `keyPath` to `value` on the instance itself and returns it.
  func also<Property>(set keyPath: ReferenceWritableKeyPath<Self, Property>, to value: Property) -> Self {
    self[keyPath: keyPath] = value
    return self
  }
}
