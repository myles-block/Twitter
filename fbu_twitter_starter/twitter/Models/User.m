//
//  User.m
//  twitter
//
//  Created by Myles Block on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    //sets up intializer for initWithDictionary

    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.profilePicture = dictionary[@"profile_image_url_https"];
        
        //...
    // Initialize any other properties
    }
    return self;
}

@end
