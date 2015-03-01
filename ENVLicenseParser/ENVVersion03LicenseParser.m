#import "ENVPerson.h"
#import "ENVVersion03LicenseParser.h"
#import "NSArray+ENVAdditions.h"
#import "NSDate+ENVAdditions.h"
#import "NSString+ENVAdditions.h"

@implementation ENVVersion03LicenseParser

+ (ENVPerson *)personFromString:(NSString *)string
{
  NSArray *components = [string componentsSeparatedByCharactersInSet:
                         [NSCharacterSet newlineCharacterSet]];
  NSDictionary *dictionary = [components env_licenseDictionary];
  NSString *licenseID = dictionary[@"DAQ"];

  NSString *street = dictionary[@"DAG"];
  NSString *city = dictionary[@"DAI"];
  NSString *state = dictionary[@"DAJ"];
  NSString *zip = dictionary[@"DAK"];
  NSString *address = [NSString env_formatAddressFromStreet:street
                                                       city:city
                                                      state:state
                                                        zip:zip];

  NSString *givenNames = [self givenNamesFromString:dictionary[@"DCT"]];
  if (!givenNames) {
    givenNames = @"";
  }
  NSString *lastName = dictionary[@"DCS"];
  NSString *fullName = [[[givenNames env_stringByJoiningString:lastName]
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

+ (NSString *)givenNamesFromString:(NSString *)string
{
  return [string stringByReplacingOccurrencesOfString:@","
                                           withString:@" "];
}

@end
