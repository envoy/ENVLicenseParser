#import <Foundation/Foundation.h>

@interface NSString (ENVAdditions)

+ (NSString *)env_formatAddressFromStreet:(NSString *)street
                                     city:(NSString *)city
                                    state:(NSString *)state
                                      zip:(NSString *)zip;

- (NSString *)env_stringByTrimmingSpaces;
- (NSString *)env_stringByJoiningString:(NSString *)string;

@end
