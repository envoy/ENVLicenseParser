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

- (void)testEquality
{
  NSString *address = [NSString stringWithFormat:AddressFormat, @"CA"];
  ENVPerson *person1 = [[ENVPerson alloc] initWithName:Name
                                             licenseID:LicenseNumber
                                               address:address
                                               expired:NO];
  ENVPerson *person2 = [[ENVPerson alloc] initWithName:Name
                                             licenseID:LicenseNumber
                                               address:address
                                               expired:NO];
  XCTAssertEqualObjects(person1, person2);
}

- (void)testInequality
{
  NSString *address1 = [NSString stringWithFormat:AddressFormat, @"CA"];
  ENVPerson *person1 = [[ENVPerson alloc] initWithName:Name
                                             licenseID:LicenseNumber
                                               address:address1
                                               expired:NO];
  NSString *address2 = [NSString stringWithFormat:AddressFormat, @"TX"];
  ENVPerson *person2 = [[ENVPerson alloc] initWithName:Name
                                             licenseID:LicenseNumber
                                               address:address2
                                               expired:NO];
  XCTAssertNotEqualObjects(person1, person2);
}

@end
