@import Foundation;
@import AFNetworking;
#import "Tweet.h"


/*@interface Api : NSObject
    +(void)getTweetsArray:(NSString*)tag andCompletion:(void (^)(Boolean success, NSArray* _Nullable data, NSString* _Nullable error))completion;
@end*/

@implementation Api

    static NSString *const twitterToken = @"Bearer AAAAAAAAAAAAAAAAAAAAABjczAAAAAAAmpsyum03hAwA3jfPdbcpIrWLwXY%3Dg5wRYqAQUdGvCiPYoWV6vAsJ5ELWctM37PDkaAFXeX1NOFgn8Y";
    static NSString *const apiEndpoint = @"https://api.twitter.com/1.1/search/tweets.json?q=%@&result_type=recent";


    +(void)getTweetsArray:(NSString*)tag andCompletion:(void (^)(Boolean success, NSArray* data, NSString* error))completion{
        
        NSString* urlStringEscaped = [[NSString stringWithFormat:apiEndpoint, tag] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *url = [NSURL URLWithString:urlStringEscaped];
        NSLog(@"url = %@", url);
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager.requestSerializer setValue:twitterToken forHTTPHeaderField:@"Authorization"];
        [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
            
            NSDictionary *jsonDict = (NSDictionary *) responseObject;
            NSMutableArray *result = [NSMutableArray new];
            
            for (id currentTweet in [jsonDict objectForKey:@"statuses"]){
                Tweet *tweet = [[Tweet alloc] initWithString:[currentTweet objectForKey:@"text"]];
                NSString *tweetText = [currentTweet objectForKey:@"text"];
                
                NSDictionary *entities = [currentTweet objectForKey:@"extended_entities"];
                NSArray *medias = [entities objectForKey:@"media"];
                
                NSMutableArray *photos = [NSMutableArray new];
                NSMutableArray *videos = [NSMutableArray new];
                
                for (id media in medias){
                    //NSLog(@"%@", [media objectForKey:@"media_url_https"]);
                    if ([[media objectForKey:@"type"] isEqualToString: @"photo"]){
                        NSURL *url = [NSURL URLWithString:[media objectForKey:@"media_url_https"]];
                        //NSLog(@"%@", url);
                        
                        //NSData *data = [NSData dataWithContentsOfURL:url];
                        //UIImage *img = [[UIImage alloc] initWithData:data];
                        
                        [photos addObject: url];
                    }
                    
                    else if ([[media objectForKey:@"type"] isEqualToString: @"video"] || [[media objectForKey:@"type"] isEqualToString: @"animated_gif"]){
                        NSDictionary *videoInfo = [media objectForKey:@"video_info"];
                        NSArray *videoVariants = [videoInfo objectForKey:@"variants"];
                        for (id variant in videoVariants){
                            if ([[variant objectForKey:@"content_type"] isEqualToString:@"video/mp4"]){
                                NSURL *url = [NSURL URLWithString:[variant objectForKey:@"url"]];
                                //NSLog(@"%@", url);
                                //NSData *data = [NSData dataWithContentsOfURL:url];
                                
                                [videos addObject:url];
                                break;
                            }
                        }
                    }
                }
                
                
                
                if (photos.count > 0){
                    tweet.photos = photos;
                }
                
                
                [result addObject:tweet];
            }
            completion(true, result, nil);
            
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            completion(false, nil, error);
        }];
        
    }
@end
