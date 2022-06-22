//
//  User.h
//  twitter
//
//  Created by Myles Block on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject


// MARK: Properties
@property (nonatomic, strong) NSString *name;//name attribute for feed model
@property (nonatomic, strong) NSString *screenName;//screenName attribute for feed model
@property (nonatomic, strong) NSString *profilePicture;//profilePicture attriblue for feed model

// Create initializer
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;//intializer for twitter feed dictionary (implementation in .m file)

@end

NS_ASSUME_NONNULL_END
