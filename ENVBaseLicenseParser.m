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
  NSString *className = [NSString stringWithFormat:@"ENVVersion%@LicenseParser", version];
  Class class = NSClassFromString(className);
  if (!class) {
    NSLog(@"ENVLicenseParser unimplemented version '%@'", version);
    return nil;
  }

  return [class personFromString:string];
}

@end
