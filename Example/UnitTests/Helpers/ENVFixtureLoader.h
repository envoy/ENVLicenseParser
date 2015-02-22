@interface ENVFixtureLoader : NSObject


+ (NSArray *)fixureURLs;
+ (NSString *)stringFromURL:(NSURL *)URL;
+ (NSString *)stringFromState:(NSString *)state;

@end
