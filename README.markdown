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

Note:

* `@"  2 3   "` chuzzles to: `@"2 3"`, that is, it only trims the string, it doesn’t eat the internal whitespace. This is because the “falsy” whitespace is just the trailing whitespace, not the internal whitespace. This is probably what you expected.


Mutable Chuzzling
=================
We removed mutable chuzzling. There are issues with adding category methods to mutable variants in Cocoa, which led to us having to enact hacks. However there were unexpected issues, eg: https://github.com/mxcl/ChuzzleKit/issues/3


Custom Chuzzling
================
All our `chuzzle` methods on container classes will call `chuzzle` on the objects they contain, if it is implemented.

So if you want to support recursive chuzzling on your own objects, simply implement a `chuzzle` method.


Making JSON PLIST-Compliant
===========================
Since `NSNull` cannot be encoded into a PLIST, a convenient (but by **no means** the primary) usage of ChuzzleKit is to make saving JSON to a plist not crash (eg. via `writeToFile:atomically`).


Stripping Strings
=================
`-chuzzle` can be a less enormous alternative to `-stringByTrimmingCharactersInSet:`, just don’t forget to expect `nil` in the response.
