#import "NSString+ENVAdditions.h"

@implementation NSString (ENVAdditions)

+ (NSString *)env_formatAddressFromStreet:(NSString *)street
                                     city:(NSString *)city
                                    state:(NSString *)state
                                      zip:(NSString *)zip
{
  if (!street) {
    street = @"";
  }

  NSString *address = [[[[street env_stringByJoiningString:city]
                         env_stringByJoiningString:state]
                        env_stringByJoiningString:zip] capitalizedString];
  NSRange range = [address rangeOfString:[state capitalizedString]
                                 options:NSBackwardsSearch];
  return [address stringByReplacingCharactersInRange:range
                                          withString:[state uppercaseString]];
}

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
