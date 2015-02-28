#import "NSDate+ENVAdditions.h"

@implementation NSDate (ENVAdditions)

+ (NSDate *)env_dateFromString:(NSString *)dateString
                    withFormat:(NSString *)dateFormat
{
  NSParameterAssert(dateFormat);
  if (!dateString) {
    return nil;
  }

  NSDateFormatter *dateFormatter = [NSDateFormatter new];
  dateFormatter.dateFormat = dateFormat;
  return [dateFormatter dateFromString:dateString];
}

- (BOOL)env_isInPast
{
  return [self timeIntervalSinceNow] < 0.0;
}

@end
