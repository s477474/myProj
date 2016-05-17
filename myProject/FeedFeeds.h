//
//  FeedFeeds.h
//
//  Created by Exception  on 16/5/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FeedShare;

@interface FeedFeeds : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) int nameId;
@property (nonatomic, assign) id videoUrl;
@property (nonatomic, assign) int isUpcoming;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) int userId;
@property (nonatomic, strong) NSString *createNickName;
@property (nonatomic, assign) int replyn;
@property (nonatomic, assign) int classId;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, assign) id hurl;
@property (nonatomic, strong) FeedShare *share;
@property (nonatomic, strong) NSString *replyTime;
@property (nonatomic, assign) int goodn;
@property (nonatomic, assign) int praiseStatus;
@property (nonatomic, strong) NSString *gameName;
@property (nonatomic, assign) int gamePlatId;
@property (nonatomic, assign) int collectStatus;
@property (nonatomic, copy) NSString* videoImg;
@property (nonatomic, assign) int collectn;
@property (nonatomic, assign) id nhurl;
@property (nonatomic, assign) int feedId;
@property (nonatomic, assign) id videoType;
@property (nonatomic, strong) NSString *updateTime;
@property (nonatomic, strong) NSString *feedType;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *acontent;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;
-(CGFloat)getContentHeight;
@end
