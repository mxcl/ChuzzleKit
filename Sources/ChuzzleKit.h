#import <Foundation/NSArray.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSString.h>
#import <Foundation/NSNull.h>


@interface NSString (Chuzzle)
/// - Returns: The receiver with whitespace trimmed from both ends, if the resulting string is empty, returns `nil`.
- (NSString * _Nullable)chuzzle;
@end

@interface NSArray (Chuzzle)
/// - Returns: The receiver with all elements chuzzled (if they support it), if the resulting array is empty, returns `nil`.
- (NSArray * _Nullable)chuzzle;
@end

@interface NSDictionary (Chuzzle)
/// - Returns: The receiver with all values chuzzled (if they support it), if the resulting dictionary is empty, returns `nil`.
- (NSDictionary * _Nullable)chuzzle;
@end

@interface NSNull (Chuzzle)
/// - Returns: `nil`
- (id _Nullable)chuzzle;
@end

@interface NSObject (Chuzzle)
/// - Returns: `self`
- (id _Nullable)chuzzle;
@end
