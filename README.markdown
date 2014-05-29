ChuzzleKit
==========

A chuzzled object is nil if it is *falsy*, otherwise it has its *falsy* parts
removed.

For example:

* `@"".chuzzle` is `nil`
* Also `@" ".chuzzle` is `nil`
* And `@"\r\t".chuzzle` is `nil`
* `@" 2 ".chuzzle` is `@"2"`
* `@[].chuzzle` is `nil`
* `@[@"", @1].chuzzle` is `@[@1]`
* `[NSNull null].chuzzle` is `nil`
* `@{}.chuzzle` is `nil`
* `@{@1: @""}.chuzzle` is `nil`
* `@{@1: @"", @2: @" 2  "}.chuzzle` is `@{@2: @"2"}`

Mutable Chuzzling
=================
Chuzzling occurs in-place, as far as it can. If a nil would be the chuzzled
result the mutable version becomes the empty equivalent, and the return is
`nil`.

Custom Chuzzling
================
All our `chuzzle` methods on container classes will call `chuzzle` on the objects they contain, if it is implemented.

So if you want to support recursive chuzzling on your own objects, simply implement a `chuzzle` method.

Making JSON PLIST-Compliant
===========================
Since `NSNull` cannot be encoded into a PLIST, a convenient (but by **no means** the primary) usage of ChuzzleKit is to make saving JSON to a plist not crash (eg. via `writeToFile:atomically`).
