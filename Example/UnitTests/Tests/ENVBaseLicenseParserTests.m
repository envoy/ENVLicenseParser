#import "ENVFixtureLoader.h"
#import "ENVBaseLicenseParser.h"
#import "NSString+ENVAdditions.h"

@interface ENVBaseLicenseParserTests : XCTestCase

@end

@implementation ENVLicenseParserTests

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
  XCTAssertNotNil([ENVBaseLicenseParser personFromString:string]);
}

@end
