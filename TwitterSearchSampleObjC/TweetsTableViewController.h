//
//  TweetsTableViewController.h
//  TwitterSearchSampleObjC
//
//  Created by Admin on 24/02/2017.
//  Copyright © 2017 Tel-Ran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TweetTableViewCell.h"

@interface TweetsTableViewController : UITableViewController
@property(readwrite, nonatomic) NSArray *tweets;
@end
