#import "ENVBaseLicenseParser.h"

@implementation ENVBaseLicenseParser

+ (ENVPerson *)personFromString:(NSString *)string
{
  if (string.length < 17) {
    return nil;
  }

  unichar character = [string characterAtIndex:0];
  if (character != '@') {
    return nil;
  }

  NSString *version = [string substringWithRange:NSMakeRange(15, 2)];

  // check first stuff
  // check version
  // class cluster parse version
  return @"";
}

@end
