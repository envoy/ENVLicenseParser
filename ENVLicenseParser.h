#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString *const ENVLicenseParserDebug;

@class ENVPerson;

@interface ENVLicenseParser : NSObject

+ (ENVPerson *)personFromString:(NSString *)string;

@end
