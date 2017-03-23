//
//  TweetTableViewCell.m
//  TwitterSearchSampleObjC
//
//  Created by Admin on 21/03/2017.
//  Copyright © 2017 Tel-Ran. All rights reserved.
//

#import "TweetTableViewCell.h"

@implementation TweetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTweet:(Tweet *)tweet{
    _image.image = nil;
    
    if (tweet.photos.count > 0){
        [_image setHidden:NO];
        _image.image = [UIImage imageWithData:[NSData dataWithContentsOfURL: tweet.photos[0]]];
    } else{
        [_image setHidden:YES];
    }
    
    _text.text = tweet.text;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
