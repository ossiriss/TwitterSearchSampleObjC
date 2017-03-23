//
//  Tweet.m
//  Pods
//
//  Created by Admin on 20/03/2017.
//
//

#import <Foundation/Foundation.h>
#import "Tweet.h"

@implementation Tweet

- (instancetype) initWithString: (NSString*)string{
    return [self initWithString:string andPhoto:nil andVideo:nil];
}

- (instancetype)initWithString:(NSString *)string andPhoto:(NSArray *)photo{
    return [self initWithString:string andPhoto:photo andVideo:nil];
}

-(instancetype)initWithString:(NSString *)string andVideo:(NSArray *)video{
    return [self initWithString:string andPhoto:nil andVideo:video];
}

- (instancetype) initWithString:(NSString *)string andPhoto:(NSArray *)photo andVideo:(NSArray *)video{
    self = [super init];
    if (self){
        self.text = string;
        self.photos = photo;
        self.videos = video;
    }
    return self;
}

@end
