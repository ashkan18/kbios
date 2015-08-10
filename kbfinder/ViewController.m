//
//  ViewController.m
//  kbfinder
//
//  Created by Ashkan Nasseri  on 8/3/15.
//  Copyright (c) 2015 ashkan. All rights reserved.
//

#import "ViewController.h"
#import "KBApiClient.h"
#import <MRProgress/MRProgress.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UITextView *resultView;
@property (nonatomic) KBApiClient *client;
@end

@implementation ViewController

- (IBAction)searchPressed:(id)sender {
    if (self.searchField.text) {
        [MRProgressOverlayView showOverlayAddedTo:self.view.window animated:YES];
        self.resultView.text = @"";
        [self.client getDegreeWithArtistName:[self.searchField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] successBlock:^(id responseObject) {
            [MRProgressOverlayView dismissOverlayForView:self.view.window animated:YES];
            NSString *string = @"";
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                string = responseObject[@"name"];
            }
            else  {
                for (NSDictionary *path in responseObject) {
                    string = [string stringByAppendingString:[NSString stringWithFormat:@"%@\n", path[@"name"]]];
                }
            }
            self.resultView.text = string;
        } errorBlock:^(NSError *error) {
            [MRProgressOverlayView dismissOverlayForView:self.view animated:YES];
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
