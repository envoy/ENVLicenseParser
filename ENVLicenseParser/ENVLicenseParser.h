@class ENVPerson;

@protocol ENVLicenseParser <NSObject>

+ (ENVPerson *)personFromString:(NSString *)string;

@end
