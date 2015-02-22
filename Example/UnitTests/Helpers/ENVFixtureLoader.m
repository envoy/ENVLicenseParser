#import "ENVFixtureLoader.h"

@implementation ENVFixtureLoader

+ (NSArray *)statesURLs
{
  return [[NSBundle bundleForClass:[self class]]
          URLsForResourcesWithExtension:@"txt"
          subdirectory:@"states"];
}

+ (NSArray *)expiredStatesURLs
{
  return [[NSBundle bundleForClass:[self class]]
          URLsForResourcesWithExtension:@"txt"
          subdirectory:@"expired"];
}

+ (NSArray *)sampleURLs
{
  return [[NSBundle bundleForClass:[self class]]
          URLsForResourcesWithExtension:@"txt"
          subdirectory:@"samples"];
}

+ (NSString *)stringFromURL:(NSURL *)URL
{
  NSAssert(URL, @"Missing file URL");
  return [[NSString alloc] initWithContentsOfURL:URL
                                        encoding:NSUTF8StringEncoding
                                           error:nil];
}

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
