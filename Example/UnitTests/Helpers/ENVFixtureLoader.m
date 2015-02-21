#import "ENVFixtureLoader.h"

@implementation ENVFixtureLoader

+ (NSString *)stringFromState:(NSString *)state
{
  NSParameterAssert(state.length == 2);
  NSURL *fileURL = [[NSBundle bundleForClass:[self class]]
                    URLForResource:state withExtension:@"txt"];
  NSAssert(fileURL, @"Missing file URL for %@", state);

  NSString *result = [[NSString alloc] initWithContentsOfURL:fileURL
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
  NSAssert(result, @"No text retrived from %@.txt", state);
  return result;
}

@end
