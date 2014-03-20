@import Foundation.NSArray;
@import Foundation.NSDictionary;
@import Foundation.NSNull;
@import Foundation.NSString;

@interface NSString (Chuzzle)
- (NSString *)chuzzle;
@end

@interface NSArray (Chuzzle)
- (instancetype)chuzzle;
@end

@interface NSDictionary (Chuzzle)
- (NSDictionary *)chuzzle;
@end

@interface NSNull (Chuzzle)
- (id)chuzzle;  // always nil
@end
