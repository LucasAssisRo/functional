# ``Functional``

The whole package behind a single import.

## Overview

`Functional` owns no API of its own. It re-exports ``FunctionalProtocols``,
``FunctionalExtensions`` and ``FunctionalUtilityTypes``, so a call site that
wants all three needs one import instead of three:

```swift
import Functional

let port = environment["PORT"]
    .takeIf { $0.isNotEmpty }
    .let(Int.init)
```

Import the individual modules instead when a target only needs part of the
package — the protocols without the standard library conformances, for
instance.

## Topics

### Modules

- ``FunctionalProtocols``
- ``FunctionalExtensions``
- ``FunctionalUtilityTypes``
