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
