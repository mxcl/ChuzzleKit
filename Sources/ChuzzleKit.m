#import <Foundation/NSCharacterSet.h>
#import "ChuzzleKit.h"

@implementation NSString (Chuzzle)

- (NSString *)chuzzle {
    NSString *s = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return s.length == 0 ? nil : s;
}

@end


@implementation NSDictionary (Chuzzle)

- (id)chuzzle {
    if (self.count == 0) {
        return nil;
    }
	NSMutableArray* objs = [NSMutableArray arrayWithCapacity:self.count];
	NSMutableArray* keys = [NSMutableArray arrayWithCapacity:self.count];
    for (id key in self) {
        id obj = self[key];
		if ([obj respondsToSelector:@selector(chuzzle)]) {
			obj = [obj chuzzle];
		}
        if (obj) {
			[objs addObject:obj];
			[keys addObject:key];
        }
    }
	return (objs.count == 0) ? nil : [NSDictionary dictionaryWithObjects:objs forKeys:keys];
}

@end


@implementation NSArray (Chuzzle)

- (instancetype)chuzzle {
    if (self.count == 0) {
        return nil;
    }
	NSMutableArray* result = [NSMutableArray arrayWithCapacity:self.count];
    for (__strong id obj in self) {
		if ([obj respondsToSelector:@selector(chuzzle)]) {
			obj = [obj chuzzle];
		}
		if (obj) {
			[result addObject:obj];
		}
    }
	return result.count == 0 ? nil : [NSArray arrayWithArray:result];
}

@end


@implementation NSNull (Chuzzle)

- (id)chuzzle {
    return nil;
}

@end


@implementation NSObject (Chuzzle)

- (id)chuzzle {
    return self;
}

@end
