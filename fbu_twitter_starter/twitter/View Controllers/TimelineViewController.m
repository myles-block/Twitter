//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "Tweet.h"
#import "TweetCell.h"

@interface TimelineViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *timelineTableView;
@property (nonatomic, strong) NSMutableArray *arrayOfTweets;
//issue with adding a property for the array of tweets and set it when the network call succeeds

@end

@implementation TimelineViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.timelineTableView.dataSource = self;//needed to call UI functions below
    self.timelineTableView.delegate = self;
    
    
    // Get timeline
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            for (Tweet *tweet in tweets) {
                NSString *text = tweet.text;
                NSLog(@"%@", text);
//                NSString *URLString = tweet.user.profilePicture;
//                NSURL *url = [NSURL URLWithString:URLString];
//                NSData *urlData = [NSData dataWithContentsOfURL:url];
                //goes into UITable View Delegate Funcion
            }
            self.arrayOfTweets = (NSMutableArray *) tweets;
            [self.timelineTableView reloadData];
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapLogout:(id)sender {//When activated via TapLogout Button: logouts and clears APIManager
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    
    [[APIManager shared] logout];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayOfTweets.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    
    Tweet *tweet = self.arrayOfTweets[indexPath.row];
    
    cell.userNameLabel.text = tweet.user.name;
    cell.userBodyLabel.text = tweet.text;
    cell.screenNameLabel.text = tweet.user.screenName;
    cell.createdAtLabel.text = tweet.createdAtString;
    
    NSString* retweetString = [[NSString alloc] initWithFormat:@"%d", tweet.retweetCount];
    
    NSString* likeString = [[NSString alloc] initWithFormat:@"%d", tweet.favoriteCount];
    
//    [cell.replyButton setTitle:retweetString forState:UIControlStateNormal];
    [cell.retweetButton setTitle:retweetString forState:UIControlStateNormal];
    [cell.likeButton setTitle:likeString forState:UIControlStateNormal];

    
    NSString *URLString = tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    
    cell.profileImageView.image = [UIImage imageWithData:urlData];
    
    return cell;
}





@end
