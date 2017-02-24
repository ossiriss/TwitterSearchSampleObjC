//
//  Api.h
//  Pods
//
//  Created by Admin on 24/02/2017.
//
//

#ifndef Api_h
#define Api_h
@interface Api : NSObject
+(void)getTweetsArray:(NSString*)tag andCompletion:(void (^)(Boolean success, NSArray* _Nullable data, NSString* _Nullable error))completion;

@end

#endif /* Api_h */
