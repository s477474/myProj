//
//  FeedFeed.h
//
//  Created by Exception  on 16/5/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface FeedFeed : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *feeds;
@property (nonatomic, assign) int ret;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
