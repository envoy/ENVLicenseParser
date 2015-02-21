#import <Foundation/Foundation.h>

@interface NSString (ENVAdditions)

- (NSString *)env_stringByTrimmingSpaces;
- (NSString *)env_stringByJoiningString:(NSString *)string;

@end
