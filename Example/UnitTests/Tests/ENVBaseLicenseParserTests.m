#import "ENVBaseLicenseParser.h"
#import "ENVFixtureLoader.h"
#import "ENVPerson.h"
#import "NSString+ENVAdditions.h"

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
  NSString *string = [ENVFixtureLoader stringFromState:@"SC"];
  ENVPerson *person = [ENVBaseLicenseParser personFromString:string];
  ENVPerson *vaildPerson = [[ENVPerson alloc] initWithName:Name
                                                 licenseID:LicenseNumber
                                                   address:[NSString stringWithFormat:AddressFormat, @"SC"]
                                                   expired:NO];
  XCTAssertEqualObjects(person, vaildPerson);
}

@end
