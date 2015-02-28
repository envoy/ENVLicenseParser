#import "NSDate+ENVAdditions.h"

@implementation NSDate (ENVAdditions)

- (BOOL)env_isInPast
{
  return [self timeIntervalSinceNow] < 0.0;
}

@end
