@import ChuzzleKit;
@import XCTest;

@implementation ChuzzleTests: XCTestCase

- (void)test_everything {
    id b = @[@{@"a": @"", @2: @"", @3: @[], @4: [NSNull null]}];
    id a = @[NSNull.null, @"\t", @{@1: @"   ", @2: b}, @1].chuzzle;
    XCTAssertEqualObjects(a, @[@1]);
}

- (void)test_no_chuzzle {
    NSDictionary *a =  @{@1: @"1", @2: @"2"};
    id b = a.chuzzle;
    XCTAssertEqualObjects(a, b);
}

- (void)test_another_test {
    NSDictionary *d = @{@1: @"", @2: @"  2  "}.chuzzle;
    XCTAssertEqualObjects(d, @{@2: @"2"});
}
- (void)test_nsobject {
    id o = [NSObject new];
    XCTAssertEqual(o, [o chuzzle]);
}
- (void)test_giant_array {
	// using a very large number of objectcs to illustrate the problem
	// and make the test trip on powerful desktop machines, but issues
	// would obviously manifest sooner on mobile devices with less memory
	NSUInteger size = 50000000;
	NSMutableArray* a = [NSMutableArray arrayWithCapacity:size];
	for (int i = 0; i < size; i++) {
		[a addObject:i % 2 ? @(i) : NSNull.null];
	}
	a = [NSArray arrayWithArray:a];
	NSArray* b;
	XCTAssertNoThrow(b = a.chuzzle);
	XCTAssertEqual(b.count, a.count / 2);
}

@end
