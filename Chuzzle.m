#import "Chuzzle.h"
#import <Foundation/NSCharacterSet.h>


@implementation NSString (Chuzzle)

- (NSString *)chuzzle {
    NSString *s = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return s.length == 0 ? nil : s;
}

@end


@implementation NSDictionary (Chuzzle)

- (id)chuzzle {
    id objs[self.count];
    id keys[self.count];
    NSUInteger x = 0;
    for (id key in self) {
        id obj = self[key];
        if ([obj respondsToSelector:@selector(chuzzle)])
            obj = [obj chuzzle];
        if (obj) {
            objs[x] = obj, keys[x] = key;
            x += 1;
        }
    }
    return x == 0 ? nil : [NSDictionary dictionaryWithObjects:objs forKeys:keys count:x];
}

@end


@implementation NSArray (Chuzzle)

- (instancetype)chuzzle {
    id objs[self.count];
    NSUInteger x = 0;
    for (__strong id obj in self) {
        if ([obj respondsToSelector:@selector(chuzzle)])
            obj = [obj chuzzle];
        if (obj)
            objs[x++] = obj;
    }
    return x == 0 ? nil : [NSArray arrayWithObjects:objs count:x];
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
