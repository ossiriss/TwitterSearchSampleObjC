@import Foundation;
@import AFNetworking;

static NSString *const twitterToken = @"Bearer AAAAAAAAAAAAAAAAAAAAABjczAAAAAAAmpsyum03hAwA3jfPdbcpIrWLwXY%3Dg5wRYqAQUdGvCiPYoWV6vAsJ5ELWctM37PDkaAFXeX1NOFgn8Y";
static NSString *const apiEndpoint = @"https://api.twitter.com/1.1/search/tweets.json?q=%@&result_type=recent";

@interface Api : NSObject
    +(void)getTweetsArray:(NSString*)tag andCompletion:(void (^)(Boolean success, NSArray* _Nullable data, NSString* _Nullable error))completion;
@end

@implementation Api

    +(void)getTweetsArray:(NSString*)tag andCompletion:(void (^)(Boolean success, NSArray* _Nullable data, NSString* _Nullable error))completion{
        
        NSString* urlStringEscaped = [[NSString stringWithFormat:apiEndpoint, tag] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *url = [NSURL URLWithString:urlStringEscaped];
        NSLog(@"url = %@", url);
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager.requestSerializer setValue:twitterToken forHTTPHeaderField:@"Authorization"];
        [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
            
            NSDictionary *jsonDict = (NSDictionary *) responseObject;
            NSMutableArray *result = [NSMutableArray new];
            
            for (id tweet in [jsonDict objectForKey:@"statuses"]){
                NSString *tweetText = [tweet objectForKey:@"text"];
                [result addObject:tweetText];
            }
            completion(true, result, nil);
            
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            completion(false, nil, error);
        }];
        
    }
@end
