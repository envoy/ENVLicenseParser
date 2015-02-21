#import "ENVPerson.h"

@implementation ENVPerson

- (instancetype)initWithName:(NSString *)name
                   licenseID:(NSString *)licenseID
                     address:(NSString *)address
                     expired:(BOOL)expired
{
  self = [super init];
  if (!self) return nil;
  
  _name = name;
  _licenseID = licenseID;
  _address = address;
  _expired = expired;
  
  return self;
}

- (BOOL)isEqual:(ENVPerson *)object
{
  if (![object isKindOfClass:[self class]]) {
    return NO;
  }
  
  if (self.expired != object.expired) {
    return NO;
  }
  
  if (![self.address isEqualToString:object.address]) {
    return NO;
  }
  
  if (![self.licenseID isEqualToString:object.licenseID]) {
    return NO;
  }
  
  if (![self.name isEqualToString:object.name]) {
    return NO;
  }
  
  return YES;
}

@end
