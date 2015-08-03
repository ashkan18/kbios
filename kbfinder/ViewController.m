//
//  ViewController.m
//  kbfinder
//
//  Created by Ashkan Nasseri  on 8/3/15.
//  Copyright (c) 2015 ashkan. All rights reserved.
//

#import "ViewController.h"
#import "KBApiClient.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UITextView *resultView;
@property (nonatomic) KBApiClient *client;
@end

@implementation ViewController

- (IBAction)searchPressed:(id)sender {
    if (self.searchField.text) {
        self.resultView.text = @"";
        [self.client getDegreeWithArtistName:@"sean-penn" successBlock:^(id responseObject) {
            NSString *string = @"";
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                string = responseObject[@"name"];
            }
            else  {
                for (NSDictionary *path in responseObject) {
                    string = [string stringByAppendingString:path[@"name"]];
                }
            }
            self.resultView.text = string;
        } errorBlock:^(NSError *error) {
            NSLog(@"error occured %@" , error);
        }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.client = [[KBApiClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://kbruby.herokuapp.com/"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
