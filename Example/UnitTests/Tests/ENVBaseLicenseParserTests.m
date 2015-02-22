#import "ENVBaseLicenseParser.h"
#import "ENVFixtureLoader.h"
#import "ENVPerson.h"
#import "NSString+ENVTestAdditions.h"

@interface ENVBaseLicenseParserTests : XCTestCase

@end

@implementation ENVBaseLicenseParserTests

- (void)testEmptyString
{
  XCTAssertNil([ENVBaseLicenseParser personFromString:@""]);
  XCTAssertNil([ENVBaseLicenseParser personFromString:nil]);
}

- (void)testMissingCompliance
{
  NSString *dummyString = [NSString stringWithCharacter:'a' count:20];
  XCTAssertNil([ENVBaseLicenseParser personFromString:dummyString]);
}

- (void)testSupportedStates
{
  NSArray *fileURLs = [ENVFixtureLoader fixureURLs];
  for (NSURL *fileURL in fileURLs) {
    NSString *filename = [[fileURL.lastPathComponent componentsSeparatedByString:@"."] firstObject];
    NSString *state = [filename substringToIndex:2];
    BOOL expired = filename.length > 2;
    NSString *string = [ENVFixtureLoader stringFromURL:fileURL];
    ENVPerson *person = [ENVBaseLicenseParser personFromString:string];
    ENVPerson *vaildPerson = [[ENVPerson alloc] initWithName:Name
                                                   licenseID:LicenseNumber
                                                     address:[NSString stringWithFormat:AddressFormat, state]
                                                     expired:expired];
    XCTAssertEqualObjects(person, vaildPerson);
  }
}

@end
