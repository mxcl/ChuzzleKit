#import <Foundation/Foundation.h>

// @import Foundation.NSArray;
// @import Foundation.NSDictionary;
// @import Foundation.NSNull;
// @import Foundation.NSString;

@interface NSString (Chuzzle)
- (instancetype)chuzzle;
@end

@interface NSArray (Chuzzle)
- (instancetype)chuzzle;
@end

@interface NSDictionary (Chuzzle)
- (instancetype)chuzzle;
@end

@interface NSNull (Chuzzle)
- (id)chuzzle;  // always nil
@end

@interface NSObject (Chuzzle)
- (id)chuzzle;  // return self
@end
