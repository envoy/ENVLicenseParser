#import "ENVLicenseParser.h"
#import "NSString+ENVAdditions.h"

@interface ENVLicenseParserTests : XCTestCase

@end

@implementation ENVLicenseParserTests

- (void)testEmptyString
{
  XCTAssertNil([ENVLicenseParser personFromString:@""]);
  XCTAssertNil([ENVLicenseParser personFromString:nil]);
}

- (void)testMissingCompliance
{
  NSString *dummyString = [NSString stringWithCharacter:'a' count:20];
  XCTAssertNil([ENVLicenseParser personFromString:dummyString]);
}

@end
