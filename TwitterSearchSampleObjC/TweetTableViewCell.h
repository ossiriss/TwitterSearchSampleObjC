//
//  TweetTableViewCell.h
//  TwitterSearchSampleObjC
//
//  Created by Admin on 21/03/2017.
//  Copyright © 2017 Tel-Ran. All rights reserved.
//

#import <UIKit/UIKit.h>
@import TwitterSearchObjC;

@interface TweetTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITextView *text;
//@property (weak, nonatomic) Tweet *tweet;
//@property (weak, nonatomic) IBOutlet UILabel *text;

- (void)setTweet:(Tweet *)tweet;

@end
