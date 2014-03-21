#import "Chuzzle.h"
@import Foundation.NSCharacterSet;


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
    return x == 0 ? nil : [[self class] dictionaryWithObjects:objs forKeys:keys count:x];
}

@end


@implementation NSMutableDictionary (Chuzzle)

- (instancetype)chuzzle {
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
        if (![obj respondsToSelector:@selector(chuzzle)])
            return;
        id chuzzled = [obj chuzzle];
        if (chuzzled)
            self[key] = chuzzled;
        else
            [self removeObjectForKey:key];
    }];
    return self.count == 0 ? nil : self;
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
    return x == 0 ? nil : [[self class] arrayWithObjects:objs count:x];
}

@end


@implementation NSMutableArray (Chuzzle)

- (NSMutableArray *)chuzzle {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger x, BOOL *stop){
        if (![obj respondsToSelector:@selector(chuzzle)])
            return;
        id chuzzled = [obj chuzzle];
        if (chuzzled)
            self[x] = chuzzled;
        else
            [self removeObject:obj];
    }];
    return self.count == 0 ? nil : self;
}

@end


@implementation NSNull (Chuzzle)

- (id)chuzzle {
    return nil;
}

@end
