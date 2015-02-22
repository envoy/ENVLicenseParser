#import "ENVPerson.h"
#import "ENVVersion01LicenseParser.h"
#import "NSArray+ENVAdditions.h"

@implementation ENVVersion01LicenseParser

+ (ENVPerson *)personFromString:(NSString *)string
{
  NSArray *components = [string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

  NSDictionary *dictionary = [components env_licenseDictionary];

  NSString *name = [self formatNameFromString:dictionary[@"DAA"]];
  NSString *street = dictionary[@"DAG"];
  NSString *city = dictionary[@"DAI"];
  NSString *state = dictionary[@"DAJ"];
  NSString *zip = dictionary[@"DAK"];
  NSString *address = [self formatAddressFromStreet:street
                                               city:city
                                              state:state
                                                zip:zip];

  return [[ENVPerson alloc] initWithName:name
                               licenseID:nil
                                 address:address
                                 expired:NO];
}

+ (NSString *)formatNameFromString:(NSString *)string
{
  NSArray *components = [string componentsSeparatedByString:@","];
  if (components.count < 1) {
    return nil;
  }

  NSString *lastName = components.firstObject;
  NSRange range = NSMakeRange(1, components.count - 1);
  NSString *givenName = [[components subarrayWithRange:range]
                         componentsJoinedByString:@" "];

  return [[[givenName stringByAppendingString:lastName]
           stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]
          capitalizedString];
}

+ (NSString *)formatAddressFromStreet:(NSString *)street
                                 city:(NSString *)city
                                state:(NSString *)state
                                  zip:(NSString *)zip
{
  return nil;
}

@end
