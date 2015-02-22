@interface ENVFixtureLoader : NSObject

+ (NSArray *)statesURLs;
+ (NSArray *)expiredStatesURLs;
+ (NSArray *)sampleURLs;
+ (NSString *)stringFromURL:(NSURL *)URL;
+ (NSString *)stringFromState:(NSString *)state;

@end
