# ``FunctionalUtilityTypes``

Store a transformation, predicate or side effect as a value you can pass around.

## Overview

The scope functions in `FunctionalProtocols` apply an operation immediately.
These types hold the same operations as values instead, so they can be stored
in a property, passed to a function or reused across call sites:

```swift
let trimmed = Map<String, String> { $0.trimmingCharacters(in: .whitespaces) }
let nonEmpty = TakeIf<String> { $0.isEmpty == false }

let name = nonEmpty(trimmed(rawInput))
```

Each type is `~Copyable` and `Sendable`, and is called through
`callAsFunction`, so it reads like the closure it wraps. Every operation comes
in a throwing variant for closures that can fail.

## Topics

### Transforming

- ``Map``
- ``ThrowingMap``

### Filtering

- ``TakeIf``
- ``ThrowingTakeIf``
- ``TakeIfNot``
- ``ThrowingTakeIfNot``

### Configuring

- ``Also``
- ``ThrowingAlso``
