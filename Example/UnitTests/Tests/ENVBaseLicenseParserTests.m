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
  NSArray *fileURLs = [ENVFixtureLoader statesURLs];
  XCTAssertTrue(fileURLs.count > 0);
  for (NSURL *fileURL in fileURLs) {
    NSString *state = [fileURL.lastPathComponent substringToIndex:2];
    NSString *string = [ENVFixtureLoader stringFromURL:fileURL];
    ENVPerson *person = [ENVBaseLicenseParser personFromString:string];
    ENVPerson *vaildPerson = [[ENVPerson alloc] initWithName:Name
                                                   licenseID:LicenseNumber
                                                     address:[NSString stringWithFormat:AddressFormat, state]
                                                     expired:NO];
    XCTAssertEqualObjects(person, vaildPerson);
  }
}

- (void)testExpiredStates
{
  NSArray *fileURLs = [ENVFixtureLoader expiredStatesURLs];
  XCTAssertTrue(fileURLs.count > 0);
  for (NSURL *fileURL in fileURLs) {
    NSString *state = [fileURL.lastPathComponent substringToIndex:2];
    NSString *string = [ENVFixtureLoader stringFromURL:fileURL];
    ENVPerson *person = [ENVBaseLicenseParser personFromString:string];
    ENVPerson *vaildPerson = [[ENVPerson alloc] initWithName:Name
                                                   licenseID:LicenseNumber
                                                     address:[NSString stringWithFormat:AddressFormat, state]
                                                     expired:YES];
    XCTAssertEqualObjects(person, vaildPerson);
  }
}

- (void)testSamples
{
  NSArray *fileURLs = [ENVFixtureLoader sampleURLs];
  XCTAssertTrue(fileURLs.count > 0);
  for (NSURL *fileURL in fileURLs) {
    NSString *string = [ENVFixtureLoader stringFromURL:fileURL];
    ENVPerson *person = [ENVBaseLicenseParser personFromString:string];
    XCTAssertNotNil(person.name);
    XCTAssertNotNil(person.address);
    XCTAssertNotNil(person.licenseID);
  }
}

@end
