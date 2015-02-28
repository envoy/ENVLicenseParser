#import "NSString+ENVAdditions.h"

@implementation NSString (ENVAdditions)

- (NSString *)env_stringByTrimmingSpaces
{
  return [self stringByTrimmingCharactersInSet:
          [NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)env_stringByJoiningString:(NSString *)string
{
  if (string.length == 0) {
    return self;
  }

  return [[@[self, string] componentsJoinedByString:@" "]
          env_stringByTrimmingSpaces];
}

@end
