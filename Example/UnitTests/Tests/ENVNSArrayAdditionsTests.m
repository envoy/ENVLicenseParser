#import "NSArray+ENVAdditions.h"

@interface ENVNSArrayAdditionsTests : XCTestCase

@end

@implementation ENVNSArrayAdditionsTests

- (void)testDictionaryFromArray
{
  NSArray *array = @[@"foobar", @"baz", @"qux1"];
  NSDictionary *dictionary = [array env_licenseDictionary];
  NSDictionary *expectedDictionary = @{@"foo": @"bar", @"qux": @"1"};
  XCTAssertEqualObjects(dictionary, expectedDictionary);
}

- (void)testDictionaryFromEmptyArray
{
  XCTAssertEqualObjects([@[] env_licenseDictionary], @{});
}

@end
