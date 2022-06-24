//
//  DetailViewController.m
//  twitter
//
//  Created by Myles Block on 6/24/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "DetailViewController.h"
#import "TweetCell.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userNameLabel.text = self.tweet.user.name;
    self.userBodyLabel.text = self.tweet.text;
    self.screenNameLabel.text = self.tweet.user.screenName;
    self.createdAtLabel.text = self.tweet.createdAgo;
    
//    NSString* retweetString = [[NSString alloc] initWithFormat:@"%d", self.tweet.retweetCount];
//    
//    NSString* likeString = [[NSString alloc] initWithFormat:@"%d", self.tweet.favoriteCount];
//    
////    [cell.replyButton setTitle:retweetString forState:UIControlStateNormal];
//    [self.retweetButton setTitle:retweetString forState:UIControlStateNormal];
//    [self.likeButton setTitle:likeString forState:UIControlStateNormal];
    
    
    NSString *URLString = self.tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    
    self.profileImageView.image = [UIImage imageWithData:urlData];
    
    
    // Do any additional setup after loading the view.
}
- (IBAction)closeButton:(id)sender {
        [self dismissViewControllerAnimated:true completion:nil];
}
//- (IBAction)didRetweet:(id)sender {
//
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
