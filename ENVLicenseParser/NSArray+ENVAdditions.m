#import "NSArray+ENVAdditions.h"

@implementation NSArray (ENVAdditions)

- (NSDictionary *)env_licenseDictionary
{
  NSMutableDictionary *dictionary = [NSMutableDictionary new];
  for (NSString *component in self) {
    if (component.length < 4) {
      continue;
    }

    NSString *key = [component substringToIndex:3];
    NSString *value = [component substringFromIndex:3];
    dictionary[key] = value;
  }

  return [dictionary copy];
}

@end
