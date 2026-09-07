# ``FunctionalProtocols``

The protocols that add inline transformation and emptiness checks to a type.

## Overview

Conforming to ``Functional`` gives a type Kotlin-style scope functions, so a
value can be transformed, filtered or configured without a temporary variable
breaking up the expression:

```swift
let label = UILabel()
    .also(set: \.text, to: title)
    .also { $0.numberOfLines = 0 }

let port = environment["PORT"]
    .takeIf { $0.isNotEmpty }
    .let(Int.init)
```

The protocol has no requirements, so conformance is a single empty extension:

```swift
extension MyType: Functional {}
```

``Emptiable`` exists so `isNotEmpty` reads as its own idea rather than a negated
`isEmpty`, which is easy to misread in a longer condition.

`FunctionalExtensions` already conforms the common standard library, Foundation
and UIKit types to both protocols.

## Topics

### Scope Functions

- ``Functional``

### Emptiness

- ``Emptiable``
