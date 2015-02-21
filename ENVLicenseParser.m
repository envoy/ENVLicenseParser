#import "ENVLicenseParser.h"

static NSString *const ComplianceString = @"@\x0A0x1E0x0DANSI ";
NSString *const ENVLicenseParserDebug = @"ENV_LICENSE_PARSER_DEBUG";

#define ENVLog(x) if (getenv(ENVLicenseParserDebug.UTF8String)) { NSLog(@"%s %@", __PRETTY_FUNCTION__, x); }

@implementation ENVLicenseParser

+ (ENVPerson *)personFromString:(NSString *)string
{
  if (string.length == 0) {
    ENVLog(@"Empty person string");
    return nil;
  }

  NSLog(@"aaa %@", ComplianceString);

  if (![string hasPrefix:ComplianceString]) {
    ENVLog(@"Invalid compliance string");
    return nil;
  }

  // check first stuff
  // check version
  // class cluster parse version
  return @"";
}

@end
