#import <Foundation/NSArray.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSString.h>
#import <Foundation/NSNull.h>


@interface NSString (Chuzzle)
- (NSString *)chuzzle;
@end

@interface NSArray (Chuzzle)
- (NSArray *)chuzzle;
@end

@interface NSDictionary (Chuzzle)
- (NSDictionary *)chuzzle;
@end

@interface NSNull (Chuzzle)
- (id)chuzzle;  // always nil
@end

@interface NSObject (Chuzzle)
- (id)chuzzle;  // return self
@end
