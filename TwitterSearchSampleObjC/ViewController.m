//
//  ViewController.m
//  TwitterSearchSampleObjC
//
//  Created by Admin on 24/02/2017.
//  Copyright © 2017 Tel-Ran. All rights reserved.
//

#import "ViewController.h"
#import "TweetsTableViewController.h"
@import TwitterSearchObjC;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchBtn:(id)sender {
    NSString *searchString = _inputText.text;
    
    if ([[searchString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]  isEqual: @""]){
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Error"
                                     message:@"You cant search for an empty string"
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction
                          actionWithTitle:@"OK"
                          style:UIAlertActionStyleDefault
                          handler:nil]];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    [Api getTweetsArray:searchString andCompletion:^(Boolean success, NSArray * _Nullable data, NSString * _Nullable error) {
        if (success){
            if (data.count == 0){
                UIAlertController * alert = [UIAlertController
                                             alertControllerWithTitle:@"Nothing found"
                                             message:@"Try to change your query"
                                             preferredStyle:UIAlertControllerStyleAlert];
                
                [alert addAction:[UIAlertAction
                                  actionWithTitle:@"OK"
                                  style:UIAlertActionStyleDefault
                                  handler:nil]];
                
                [self presentViewController:alert animated:YES completion:nil];
                return;
            }
            
            [self performSegueWithIdentifier:@"showTableView" sender:data];
        }
    }];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"showTableView"])
    {
        TweetsTableViewController *vc = [segue destinationViewController];
        
        vc.tweets = sender;
    }
}

@end
