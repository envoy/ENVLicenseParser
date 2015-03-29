#import <Foundation/Foundation.h>

@interface NSDate (ENVAdditions)

+ (NSDate *)env_dateFromString:(NSString *)dateString
                    withFormat:(NSString *)dateFormat;
- (BOOL)env_isInPast;

@end
