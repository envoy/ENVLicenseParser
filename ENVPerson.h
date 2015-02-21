@import Foundation;

@interface ENVPerson : NSObject

@property (nonatomic, readonly) BOOL expired;
@property (nonatomic, readonly) NSString *address;
@property (nonatomic, readonly) NSString *licenseID;
@property (nonatomic, readonly) NSString *name;

- (instancetype)initWithName:(NSString *)name
                   licenseID:(NSString *)licenseID
                     address:(NSString *)address
                     expired:(BOOL)expired;

@end
