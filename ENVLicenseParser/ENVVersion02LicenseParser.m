#import "ENVPerson.h"
#import "ENVVersion02LicenseParser.h"
#import "NSArray+ENVAdditions.h"
#import "NSDate+ENVAdditions.h"
#import "NSString+ENVAdditions.h"

@implementation ENVVersion02LicenseParser

+ (ENVPerson *)personFromString:(NSString *)string
{
  NSArray *components = [string componentsSeparatedByCharactersInSet:
                         [NSCharacterSet newlineCharacterSet]];
  NSDictionary *dictionary = [components env_licenseDictionary];
  NSString *licenseID = dictionary[@"DAQ"];
  
  NSString *givenNames = [self givenNamesFromString:dictionary[@"DCT"]];
  if (!givenNames) {
    givenNames = @"";
  }
  NSString *lastName = dictionary[@"DCS"];
  NSString *nameSuffix = dictionary[@"DCU"];
  NSString *fullName = [[[[givenNames env_stringByJoiningString:lastName]
                          env_stringByJoiningString:nameSuffix]
                         env_stringByTrimmingSpaces]
                        capitalizedString];
  NSString *street = dictionary[@"DAG"];
  NSString *city = dictionary[@"DAI"];
  NSString *state = dictionary[@"DAJ"];
  NSString *zip = dictionary[@"DAK"];
  NSString *dateString = dictionary[@"DBA"];
  NSDate *date = [NSDate env_dateFromString:dateString
                                 withFormat:@"MMddyyyy"];
  BOOL expired = [date env_isInPast];
  NSString *address = [NSString env_formatAddressFromStreet:street
                                                       city:city
                                                      state:state
                                                        zip:zip];

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
