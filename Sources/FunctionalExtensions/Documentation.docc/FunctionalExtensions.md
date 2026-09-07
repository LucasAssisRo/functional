# ``FunctionalExtensions``

Ready-made conformances for the standard library, Foundation and UIKit.

## Overview

Importing this module conforms the types you already use to the protocols in
`FunctionalProtocols`, so the scope functions are available without writing an
empty extension for each one:

```swift
import FunctionalExtensions

let url = URL(string: raw)?.also { print("opening \($0)") }
```

`Functional` is added to `Int`, `Int64`, `Double`, `String`, `String.Index`,
`Array`, `Dictionary` and `Result`; to `NSObject`, `URL`, `Date` and `Data`
where Foundation is available; and to `CGFloat`, `CGSize` and `CGRect` where
UIKit is. `Emptiable` is added to `String`, `Array`, `Set`, `Dictionary`,
`CollectionOfOne` and `EmptyCollection`.

The Foundation and UIKit conformances are behind `canImport` checks, so the
module still builds where those frameworks are absent.
