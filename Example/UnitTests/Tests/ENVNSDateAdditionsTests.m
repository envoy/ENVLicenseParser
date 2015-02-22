#import "NSDate+ENVAdditions.h"

@interface ENVNSDateAdditionsTests : XCTestCase

@end

@implementation ENVNSDateAdditionsTests

- (void)testIsDateInPast
{
  NSDate *date = [NSDate dateWithTimeIntervalSinceNow:-100];
  XCTAssertTrue([date env_isInPast]);
}

- (void)testDateIsNotInPast
{
  NSDate *date = [NSDate dateWithTimeIntervalSinceNow:100];
  XCTAssertFalse([date env_isInPast]);
}

@end
