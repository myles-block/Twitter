//
//  Tweet.m
//  twitter
//
//  Created by Myles Block on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "Tweet.h"
#import "User.h"
#import "DateTools.h"

@implementation Tweet

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    //sets up intializer for initWithDictionary and handles retweets

    if (self) {
        // MARK: Is this a re-tweet? (handles retweets)
        NSDictionary *originalTweet = dictionary[@"retweeted_status"];
        if (originalTweet != nil) {
            NSDictionary *userDictionary = dictionary[@"user"];
            self.retweetedByUser = [[User alloc] initWithDictionary:userDictionary];

            // Change tweet to original tweet
            dictionary = originalTweet;
        }
        //MARK: Properties (assigns created properties from header file)
        self.idStr = dictionary[@"id_str"];
        self.text = dictionary[@"text"];
        self.favoriteCount = [dictionary[@"favorite_count"] intValue];
        self.favorited = [dictionary[@"favorited"] boolValue];
        self.retweetCount = [dictionary[@"retweet_count"] intValue];
        self.retweeted = [dictionary[@"retweeted"] boolValue];

        // TODO: Initialize user (creates user pointer that pulls from dictionary index: "user" property & sets
        NSDictionary *user = dictionary[@"user"];
        self.user = [[User alloc] initWithDictionary:user];
        
        // TODO: Format and set createdAtString
        // Format createdAt date string: creates original string pointer that pulls from dictionary index: "created_at" property
        NSString *createdAtOriginalString = dictionary[@"created_at"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        // Configure the input format to parse the date string
        formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
        // Convert String to Date
        NSDate *date = [formatter dateFromString:createdAtOriginalString];
        NSString *dateString = [date shortTimeAgoSinceNow];
        self.createdAgo = [date shortTimeAgoSinceNow];
        
//        // Configure output format
//        formatter.dateStyle = NSDateFormatterShortStyle;
//        formatter.timeStyle = NSDateFormatterNoStyle;
//        // Convert Date to String
//        self.createdAtString = [formatter stringFromDate:date];
    }
    return self;
}

//MARK: Array that returns Tweets when initialized with an array of Tweet dictionaries
+ (NSMutableArray *)tweetsWithArray:(NSArray *)dictionaries {
    NSMutableArray *tweets = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        Tweet *tweet = [[Tweet alloc] initWithDictionary:dictionary];
        [tweets addObject:tweet];
    }
    return tweets;
}



@end
