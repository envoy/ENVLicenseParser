#import "ENVPerson.h"
#import "ENVVersion07LicenseParser.h"
#import "NSArray+ENVAdditions.h"
#import "NSDate+ENVAdditions.h"
#import "NSString+ENVAdditions.h"

@implementation ENVVersion07LicenseParser

+ (ENVPerson *)personFromString:(NSString *)string {
  NSArray *components = [string componentsSeparatedByCharactersInSet:
                         [NSCharacterSet newlineCharacterSet]];
  NSDictionary *dictionary = [components env_licenseDictionary];

  NSString *licenseID = [self formatLicenseIDFromString:dictionary[@"ANS"]];
  NSString *street = dictionary[@"DAG"];
  NSString *city = dictionary[@"DAI"];
  NSString *state = dictionary[@"DAJ"];
  NSString *zip = dictionary[@"DAK"];
  NSString *address = [NSString env_formatAddressFromStreet:street
                                                       city:city
                                                      state:state
                                                        zip:zip];
  
  NSString *firstName = dictionary[@"DAC"];
  if (!firstName) {
    firstName = @"";
  }
  NSString *middleName = [NSString env_nameByFilteringNone:dictionary[@"DAD"]];
  NSString *lastName = dictionary[@"DCS"];
  NSString *fullName = [[[[firstName env_stringByJoiningString:middleName]
                          env_stringByJoiningString:lastName]
                         env_stringByTrimmingSpaces]
                        capitalizedString];

  NSString *expirationDateSting = dictionary[@"DBA"];
  NSDate *expirationDate = [NSDate env_dateFromString:expirationDateSting
                                           withFormat:@"MMddyyyy"];
  BOOL expired = [expirationDate env_isInPast];

  return [[ENVPerson alloc] initWithName:fullName
                               licenseID:licenseID
                                 address:address
                                 expired:expired];
}

+ (NSString *)formatLicenseIDFromString:(NSString *)string {
  NSArray *components = [string componentsSeparatedByString:@"DAQ"];
  if (components.count < 2) {
    return nil;
  }

  return [components.lastObject env_stringByTrimmingSpaces];
}

@end
