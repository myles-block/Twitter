//
//  TweetCell.m
//  twitter
//
//  Created by Myles Block on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)didTapFavorite:(id)sender {
    // TODO: Update the local tweet model
    self.tweet.favorited = YES;
    self.tweet.favoriteCount += 1;
    
    
    //MARK: work on updating cell UI
//    // TODO: Update cell UI
//    self.userNameLabel.text = self.tweet.user.name;
//    self.userBodyLabel.text = self.tweet.text;
//    self.screenNameLabel.text = self.tweet.user.screenName;
//    self.createdAtLabel.text = self.tweet.createdAtString;
//
//    NSString* retweetString = [[NSString alloc] initWithFormat:@"%d", self.tweet.retweetCount];
//
//    NSString* likeString = [[NSString alloc] initWithFormat:@"%d", self.tweet.favoriteCount];
    
    
    
    // TODO: Send a POST request to the POST favorites/create endpoint
}





@end
