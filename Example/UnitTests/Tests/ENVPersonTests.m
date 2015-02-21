#import "ENVPerson.h"

@interface ENVPersonTests : XCTestCase

@end

@implementation ENVPersonTests

- (void)testCreation
{
  NSString *address = [NSString stringWithFormat:AddressFormat, @"CA"];
  ENVPerson *person = [[ENVPerson alloc] initWithName:Name
                                            licenseID:LicenseNumber
                                              address:address
                                              expired:NO];
  XCTAssertEqualObjects(person.name, Name);
  XCTAssertEqualObjects(person.licenseID, LicenseNumber);
  XCTAssertEqualObjects(person.address, address);
  XCTAssertFalse(person.expired);
}

@end
