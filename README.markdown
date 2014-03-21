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

Notably, I couldn't make an `[NSMutableString chuzzle]`. PRs welcome.
