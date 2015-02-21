#import "ENVLicenseParser.h"

NSString *const ENVLicenseParserDebug = @"ENV_LICENSE_PARSER_DEBUG";

#define ENVLog(x) if (getenv(ENVLicenseParserDebug.UTF8String)) { NSLog(@"%s %@", __PRETTY_FUNCTION__, x); }

@implementation ENVLicenseParser

+ (ENVPerson *)personFromString:(NSString *)string
{
  if (string.length == 0) {
    ENVLog(@"Empty person string");
    return nil;
  }

  unichar character = [string characterAtIndex:0];
  if (character != '@') {
    ENVLog(@"Invalid compliance string");
    return nil;
  }

  // check first stuff
  // check version
  // class cluster parse version
  return @"";
}

@end
