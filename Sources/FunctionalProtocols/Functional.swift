// MARK: - Functional

public protocol Functional {}

extension Functional {
    public func `let`<Tranformed>(_ block: (Self) throws -> Tranformed) rethrows -> Tranformed {
        try block(self)
    }

    public func takeIf(_ block: (Self) -> Bool) -> Self? {
        if block(self) {
            self
        } else {
            nil
        }
    }

    public func takeIfNot(_ block: (Self) -> Bool) -> Self? {
        if !block(self) {
            self
        } else {
            nil
        }
    }

    public func also(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }

    public func also<Property>(set keyPath: WritableKeyPath<Self, Property>, to value: Property) -> Self {
        var new = self
        new[keyPath: keyPath] = value
        return new
    }
}

// MARK: - Functional + AnyObject

extension Functional where Self: AnyObject {
    public func also(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }

    public func also<Property>(set keyPath: ReferenceWritableKeyPath<Self, Property>, to value: Property) -> Self {
        self[keyPath: keyPath] = value
        return self
    }
}
