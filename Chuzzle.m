#import "Chuzzle.h"
@import Foundation.NSCharacterSet;

// You can't have category methods on a subclass and a superclass, the one that
// gets called in undefined. IME sometimes it works, sometimes it doesn’t.
// Hence we check for mutability in a single chuzzle function. The mutability
// check is weird, but it turns out class-clusters make isKindOfClass:
// unreliable for testing mutability.


@implementation NSString (Chuzzle)

- (NSString *)chuzzle {
    NSString *s = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (self.classForCoder == [NSMutableString class]) {
        [(id)self setString:s];
        return self.length == 0 ? nil : self;
    } else
        return s.length == 0 ? nil : s;
}

@end


@implementation NSDictionary (Chuzzle)

- (id)chuzzle {
    if (self.classForCoder == [NSMutableDictionary class]) {
        [self.copy enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
            NSMutableDictionary *dict = (id)self;
            if (![obj respondsToSelector:@selector(chuzzle)])
                return;
            id chuzzled = [obj chuzzle];
            if (chuzzled)
                dict[key] = chuzzled;
            else
                [dict removeObjectForKey:key];
        }];
        return self.count == 0 ? nil : self;
    }
    
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
    if (self.classForCoder == [NSMutableArray class]) {
        NSMutableArray *rms = [NSMutableArray new];
        for (uint x = 0; x < self.count; ++x) {
            id obj = self[x];
            if ([obj respondsToSelector:@selector(chuzzle)]) {
                id chuzzled = [obj chuzzle];
                if (chuzzled)
                    ((id)self)[x] = chuzzled;
                else
                    [rms addObject:obj];
            }
        };
        [(id)self removeObjectsInArray:rms];
        return self.count == 0 ? nil : self;
    }
    
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
