//
//  FeedFeeds.m
//
//  Created by Exception  on 16/5/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FeedFeeds.h"
#import "FeedShare.h"


NSString *const kFeedFeedsNameId = @"name_id";
NSString *const kFeedFeedsVideoUrl = @"video_url";
NSString *const kFeedFeedsIsUpcoming = @"is_upcoming";
NSString *const kFeedFeedsTitle = @"title";
NSString *const kFeedFeedsUserId = @"user_id";
NSString *const kFeedFeedsCreateNickName = @"create_nick_name";
NSString *const kFeedFeedsReplyn = @"replyn";
NSString *const kFeedFeedsClassId = @"class_id";
NSString *const kFeedFeedsCreateTime = @"create_time";
NSString *const kFeedFeedsHurl = @"hurl";
NSString *const kFeedFeedsShare = @"share";
NSString *const kFeedFeedsReplyTime = @"reply_time";
NSString *const kFeedFeedsGoodn = @"goodn";
NSString *const kFeedFeedsPraiseStatus = @"praise_status";
NSString *const kFeedFeedsGameName = @"game_name";
NSString *const kFeedFeedsGamePlatId = @"game_plat_id";
NSString *const kFeedFeedsCollectStatus = @"collect_status";
NSString *const kFeedFeedsVideoImg = @"video_img";
NSString *const kFeedFeedsCollectn = @"collectn";
NSString *const kFeedFeedsNhurl = @"nhurl";
NSString *const kFeedFeedsFeedId = @"feed_id";
NSString *const kFeedFeedsVideoType = @"video_type";
NSString *const kFeedFeedsUpdateTime = @"update_time";
NSString *const kFeedFeedsFeedType = @"feed_type";
NSString *const kFeedFeedsContent = @"content";
NSString *const kFeedFeedsAcontent = @"acontent";


@interface FeedFeeds ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FeedFeeds

@synthesize nameId = _nameId;
@synthesize videoUrl = _videoUrl;
@synthesize isUpcoming = _isUpcoming;
@synthesize title = _title;
@synthesize userId = _userId;
@synthesize createNickName = _createNickName;
@synthesize replyn = _replyn;
@synthesize classId = _classId;
@synthesize createTime = _createTime;
@synthesize hurl = _hurl;
@synthesize share = _share;
@synthesize replyTime = _replyTime;
@synthesize goodn = _goodn;
@synthesize praiseStatus = _praiseStatus;
@synthesize gameName = _gameName;
@synthesize gamePlatId = _gamePlatId;
@synthesize collectStatus = _collectStatus;
@synthesize videoImg = _videoImg;
@synthesize collectn = _collectn;
@synthesize nhurl = _nhurl;
@synthesize feedId = _feedId;
@synthesize videoType = _videoType;
@synthesize updateTime = _updateTime;
@synthesize feedType = _feedType;
@synthesize content = _content;
@synthesize acontent = _acontent;

-(CGFloat)getContentHeight;
{
        float contentWidth=SCREEN_WIDTH;
        float contentHeight=[_content boundingRectWithSize:CGSizeMake(contentWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height+20;
    return contentHeight;
}
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.nameId = [[self objectOrNilForKey:kFeedFeedsNameId fromDictionary:dict] intValue];
            self.videoUrl = [self objectOrNilForKey:kFeedFeedsVideoUrl fromDictionary:dict];
            self.isUpcoming = [[self objectOrNilForKey:kFeedFeedsIsUpcoming fromDictionary:dict] intValue];
            self.title = [self objectOrNilForKey:kFeedFeedsTitle fromDictionary:dict];
            self.userId = [[self objectOrNilForKey:kFeedFeedsUserId fromDictionary:dict] intValue];
            self.createNickName = [self objectOrNilForKey:kFeedFeedsCreateNickName fromDictionary:dict];
            self.replyn = [[self objectOrNilForKey:kFeedFeedsReplyn fromDictionary:dict] intValue];
            self.classId = [[self objectOrNilForKey:kFeedFeedsClassId fromDictionary:dict] intValue];
            self.createTime = [self objectOrNilForKey:kFeedFeedsCreateTime fromDictionary:dict];
            self.hurl = [self objectOrNilForKey:kFeedFeedsHurl fromDictionary:dict];
            self.share = [FeedShare modelObjectWithDictionary:[dict objectForKey:kFeedFeedsShare]];
            self.replyTime = [self objectOrNilForKey:kFeedFeedsReplyTime fromDictionary:dict];
            self.goodn = [[self objectOrNilForKey:kFeedFeedsGoodn fromDictionary:dict] intValue];
            self.praiseStatus = [[self objectOrNilForKey:kFeedFeedsPraiseStatus fromDictionary:dict] intValue];
            self.gameName = [self objectOrNilForKey:kFeedFeedsGameName fromDictionary:dict];
            self.gamePlatId = [[self objectOrNilForKey:kFeedFeedsGamePlatId fromDictionary:dict] intValue];
            self.collectStatus = [[self objectOrNilForKey:kFeedFeedsCollectStatus fromDictionary:dict] intValue];
            self.videoImg = [self objectOrNilForKey:kFeedFeedsVideoImg fromDictionary:dict];
            self.collectn = [[self objectOrNilForKey:kFeedFeedsCollectn fromDictionary:dict] intValue];
            self.nhurl = [self objectOrNilForKey:kFeedFeedsNhurl fromDictionary:dict];
            self.feedId = [[self objectOrNilForKey:kFeedFeedsFeedId fromDictionary:dict] intValue];
            self.videoType = [self objectOrNilForKey:kFeedFeedsVideoType fromDictionary:dict];
            self.updateTime = [self objectOrNilForKey:kFeedFeedsUpdateTime fromDictionary:dict];
            self.feedType = [self objectOrNilForKey:kFeedFeedsFeedType fromDictionary:dict];
            self.content = [self objectOrNilForKey:kFeedFeedsContent fromDictionary:dict];
            self.acontent = [self objectOrNilForKey:kFeedFeedsAcontent fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithInt:self.nameId] forKey:kFeedFeedsNameId];
    [mutableDict setValue:self.videoUrl forKey:kFeedFeedsVideoUrl];
    [mutableDict setValue:[NSNumber numberWithInt:self.isUpcoming] forKey:kFeedFeedsIsUpcoming];
    [mutableDict setValue:self.title forKey:kFeedFeedsTitle];
    [mutableDict setValue:[NSNumber numberWithInt:self.userId] forKey:kFeedFeedsUserId];
    [mutableDict setValue:self.createNickName forKey:kFeedFeedsCreateNickName];
    [mutableDict setValue:[NSNumber numberWithInt:self.replyn] forKey:kFeedFeedsReplyn];
    [mutableDict setValue:[NSNumber numberWithInt:self.classId] forKey:kFeedFeedsClassId];
    [mutableDict setValue:self.createTime forKey:kFeedFeedsCreateTime];
    [mutableDict setValue:self.hurl forKey:kFeedFeedsHurl];
    [mutableDict setValue:[self.share dictionaryRepresentation] forKey:kFeedFeedsShare];
    [mutableDict setValue:self.replyTime forKey:kFeedFeedsReplyTime];
    [mutableDict setValue:[NSNumber numberWithInt:self.goodn] forKey:kFeedFeedsGoodn];
    [mutableDict setValue:[NSNumber numberWithInt:self.praiseStatus] forKey:kFeedFeedsPraiseStatus];
    [mutableDict setValue:self.gameName forKey:kFeedFeedsGameName];
    [mutableDict setValue:[NSNumber numberWithInt:self.gamePlatId] forKey:kFeedFeedsGamePlatId];
    [mutableDict setValue:[NSNumber numberWithInt:self.collectStatus] forKey:kFeedFeedsCollectStatus];
    [mutableDict setValue:self.videoImg forKey:kFeedFeedsVideoImg];
    [mutableDict setValue:[NSNumber numberWithInt:self.collectn] forKey:kFeedFeedsCollectn];
    [mutableDict setValue:self.nhurl forKey:kFeedFeedsNhurl];
    [mutableDict setValue:[NSNumber numberWithInt:self.feedId] forKey:kFeedFeedsFeedId];
    [mutableDict setValue:self.videoType forKey:kFeedFeedsVideoType];
    [mutableDict setValue:self.updateTime forKey:kFeedFeedsUpdateTime];
    [mutableDict setValue:self.feedType forKey:kFeedFeedsFeedType];
    [mutableDict setValue:self.content forKey:kFeedFeedsContent];
    [mutableDict setValue:self.acontent forKey:kFeedFeedsAcontent];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.nameId = [aDecoder decodeIntForKey:kFeedFeedsNameId];
    self.videoUrl = [aDecoder decodeObjectForKey:kFeedFeedsVideoUrl];
    self.isUpcoming = [aDecoder decodeIntForKey:kFeedFeedsIsUpcoming];
    self.title = [aDecoder decodeObjectForKey:kFeedFeedsTitle];
    self.userId = [aDecoder decodeIntForKey:kFeedFeedsUserId];
    self.createNickName = [aDecoder decodeObjectForKey:kFeedFeedsCreateNickName];
    self.replyn = [aDecoder decodeIntForKey:kFeedFeedsReplyn];
    self.classId = [aDecoder decodeIntForKey:kFeedFeedsClassId];
    self.createTime = [aDecoder decodeObjectForKey:kFeedFeedsCreateTime];
    self.hurl = [aDecoder decodeObjectForKey:kFeedFeedsHurl];
    self.share = [aDecoder decodeObjectForKey:kFeedFeedsShare];
    self.replyTime = [aDecoder decodeObjectForKey:kFeedFeedsReplyTime];
    self.goodn = [aDecoder decodeIntForKey:kFeedFeedsGoodn];
    self.praiseStatus = [aDecoder decodeIntForKey:kFeedFeedsPraiseStatus];
    self.gameName = [aDecoder decodeObjectForKey:kFeedFeedsGameName];
    self.gamePlatId = [aDecoder decodeIntForKey:kFeedFeedsGamePlatId];
    self.collectStatus = [aDecoder decodeIntForKey:kFeedFeedsCollectStatus];
    self.videoImg = [aDecoder decodeObjectForKey:kFeedFeedsVideoImg];
    self.collectn = [aDecoder decodeIntForKey:kFeedFeedsCollectn];
    self.nhurl = [aDecoder decodeObjectForKey:kFeedFeedsNhurl];
    self.feedId = [aDecoder decodeIntForKey:kFeedFeedsFeedId];
    self.videoType = [aDecoder decodeObjectForKey:kFeedFeedsVideoType];
    self.updateTime = [aDecoder decodeObjectForKey:kFeedFeedsUpdateTime];
    self.feedType = [aDecoder decodeObjectForKey:kFeedFeedsFeedType];
    self.content = [aDecoder decodeObjectForKey:kFeedFeedsContent];
    self.acontent = [aDecoder decodeObjectForKey:kFeedFeedsAcontent];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeInt:_nameId forKey:kFeedFeedsNameId];
    [aCoder encodeObject:_videoUrl forKey:kFeedFeedsVideoUrl];
    [aCoder encodeInt:_isUpcoming forKey:kFeedFeedsIsUpcoming];
    [aCoder encodeObject:_title forKey:kFeedFeedsTitle];
    [aCoder encodeInt:_userId forKey:kFeedFeedsUserId];
    [aCoder encodeObject:_createNickName forKey:kFeedFeedsCreateNickName];
    [aCoder encodeInt:_replyn forKey:kFeedFeedsReplyn];
    [aCoder encodeInt:_classId forKey:kFeedFeedsClassId];
    [aCoder encodeObject:_createTime forKey:kFeedFeedsCreateTime];
    [aCoder encodeObject:_hurl forKey:kFeedFeedsHurl];
    [aCoder encodeObject:_share forKey:kFeedFeedsShare];
    [aCoder encodeObject:_replyTime forKey:kFeedFeedsReplyTime];
    [aCoder encodeInt:_goodn forKey:kFeedFeedsGoodn];
    [aCoder encodeInt:_praiseStatus forKey:kFeedFeedsPraiseStatus];
    [aCoder encodeObject:_gameName forKey:kFeedFeedsGameName];
    [aCoder encodeInt:_gamePlatId forKey:kFeedFeedsGamePlatId];
    [aCoder encodeInt:_collectStatus forKey:kFeedFeedsCollectStatus];
    [aCoder encodeObject:_videoImg forKey:kFeedFeedsVideoImg];
    [aCoder encodeInt:_collectn forKey:kFeedFeedsCollectn];
    [aCoder encodeObject:_nhurl forKey:kFeedFeedsNhurl];
    [aCoder encodeInt:_feedId forKey:kFeedFeedsFeedId];
    [aCoder encodeObject:_videoType forKey:kFeedFeedsVideoType];
    [aCoder encodeObject:_updateTime forKey:kFeedFeedsUpdateTime];
    [aCoder encodeObject:_feedType forKey:kFeedFeedsFeedType];
    [aCoder encodeObject:_content forKey:kFeedFeedsContent];
    [aCoder encodeObject:_acontent forKey:kFeedFeedsAcontent];
}

- (id)copyWithZone:(NSZone *)zone
{
    FeedFeeds *copy = [[FeedFeeds alloc] init];
    
    if (copy) {

        copy.nameId = self.nameId;
        copy.videoUrl = [self.videoUrl copyWithZone:zone];
        copy.isUpcoming = self.isUpcoming;
        copy.title = [self.title copyWithZone:zone];
        copy.userId = self.userId;
        copy.createNickName = [self.createNickName copyWithZone:zone];
        copy.replyn = self.replyn;
        copy.classId = self.classId;
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.hurl = [self.hurl copyWithZone:zone];
        copy.share = [self.share copyWithZone:zone];
        copy.replyTime = [self.replyTime copyWithZone:zone];
        copy.goodn = self.goodn;
        copy.praiseStatus = self.praiseStatus;
        copy.gameName = [self.gameName copyWithZone:zone];
        copy.gamePlatId = self.gamePlatId;
        copy.collectStatus = self.collectStatus;
        copy.videoImg = [self.videoImg copyWithZone:zone];
        copy.collectn = self.collectn;
        copy.nhurl = [self.nhurl copyWithZone:zone];
        copy.feedId = self.feedId;
        copy.videoType = [self.videoType copyWithZone:zone];
        copy.updateTime = [self.updateTime copyWithZone:zone];
        copy.feedType = [self.feedType copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.acontent = [self.acontent copyWithZone:zone];
    }
    
    return copy;
}


@end
