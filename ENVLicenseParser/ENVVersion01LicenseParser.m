#import "ENVPerson.h"
#import "ENVVersion01LicenseParser.h"
#import "NSArray+ENVAdditions.h"
#import "NSDate+ENVAdditions.h"
#import "NSString+ENVAdditions.h"

@implementation ENVVersion01LicenseParser

+ (ENVPerson *)personFromString:(NSString *)string {
  NSArray *components = [string componentsSeparatedByCharactersInSet:
                         [NSCharacterSet newlineCharacterSet]];
  NSDictionary *dictionary = [components env_licenseDictionary];
  
  NSString *licenseID = [self formatLicenseIDFromString:dictionary[@"ANS"]];
  NSString *name = [self formatNameFromString:dictionary[@"DAA"]];
  NSString *street = dictionary[@"DAG"];
  NSString *city = dictionary[@"DAI"];
  NSString *state = dictionary[@"DAJ"];
  NSString *zip = dictionary[@"DAK"];
  NSString *dateString = dictionary[@"DBA"];
  NSDate *date = [NSDate env_dateFromString:dateString
                                 withFormat:@"yyyyMMdd"];
  BOOL expired = [date env_isInPast];
  NSString *address = [NSString env_formatAddressFromStreet:street
                                                       city:city
                                                      state:state
                                                        zip:zip];

  return [[ENVPerson alloc] initWithName:name
                               licenseID:licenseID
                                 address:address
                                 expired:expired];
}

+ (NSString *)formatNameFromString:(NSString *)string {
  NSArray *components = [string componentsSeparatedByString:@","];
  if (components.count < 1) {
    return nil;
  }

  NSString *lastName = components.firstObject;
  NSRange range = NSMakeRange(1, components.count - 1);
  NSString *givenName = [[components subarrayWithRange:range]
                         componentsJoinedByString:@" "];

  return [[[givenName stringByAppendingString:lastName]
           env_stringByTrimmingSpaces] capitalizedString];
}

+ (NSString *)formatLicenseIDFromString:(NSString *)string {
  NSArray *components = [string componentsSeparatedByString:@"DAQ"];
  if (components.count < 2) {
    return nil;
  }

  return [components.lastObject env_stringByTrimmingSpaces];
}

@end
