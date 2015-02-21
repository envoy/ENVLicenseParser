#import "NSString+ENVAdditions.h"

@implementation NSString (ENVAdditions)

+ (NSString *)stringWithCharacter:(unichar)character
                            count:(NSUInteger)count
{
  NSString *string = @"";

  for (NSUInteger i = 0; i < count; i++) {
    string = [string stringByAppendingFormat:@"%c", character];
  }

  return string;
}

@end
