//
//  AppDelegate.h
//  TwitterSearchSampleObjC
//
//  Created by Admin on 24/02/2017.
//  Copyright © 2017 Tel-Ran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end

