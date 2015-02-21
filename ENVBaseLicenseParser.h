#import <Foundation/Foundation.h>

@class ENVPerson;

@protocol ENVLicenseParser <NSObject>

+ (ENVPerson *)personFromString:(NSString *)string;

@end

@interface ENVBaseLicenseParser : NSObject <ENVLicenseParser>

@end
