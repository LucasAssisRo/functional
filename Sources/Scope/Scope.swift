public protocol Scope {}

public extension Scope {
    @inline(__always)
    func map<Tranformed>(block: (Self) throws -> Tranformed) rethrows -> Tranformed { try block(self) }

    @inline(__always)
    func appling(block: (inout Self) throws -> Void) rethrows -> Self {
        var mutaded = self
        try block(&mutaded)
        return mutaded
    }
}

public extension Scope where Self: AnyObject {
    @inline(__always)
    func apply(block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }
}



public extension NSObject: Scope {}
