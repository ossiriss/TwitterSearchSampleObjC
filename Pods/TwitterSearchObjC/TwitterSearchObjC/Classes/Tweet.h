//
//  Tweet.h
//  Pods
//
//  Created by Admin on 20/03/2017.
//
//

#ifndef Tweet_h
#define Tweet_h
@interface Tweet : NSObject

@property NSString* text;
@property NSArray* photos;
@property NSArray* videos;

- (instancetype) initWithString: (NSString*)string;
- (instancetype) initWithString: (NSString*)string andPhoto: (NSArray*)photo;
- (instancetype) initWithString: (NSString*)string andVideo: (NSArray*)video;
- (instancetype) initWithString: (NSString*)string andPhoto: (NSArray*)photo andVideo: (NSArray*)video;

@end

#endif /* Tweet_h */
