//
//  GameDetailGame.m
//
//  Created by Exception  on 16/5/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GameDetailGame.h"
#import "GameDetailImages.h"


NSString *const kGameDetailGameOfficialId = @"official_id";
NSString *const kGameDetailGameGameId = @"game_id";
NSString *const kGameDetailGameRaten = @"raten";
NSString *const kGameDetailGameIsDuzhan = @"is_duzhan";
NSString *const kGameDetailGameCommentn = @"commentn";
NSString *const kGameDetailGameCoverImg = @"cover_img";
NSString *const kGameDetailGameIsUpcoming = @"is_upcoming";
NSString *const kGameDetailGameWannan = @"wannan";
NSString *const kGameDetailGameStrategyConfigUrl = @"strategy_config_url";
NSString *const kGameDetailGamePsnid = @"psnid";
NSString *const kGameDetailGameGamePlatId = @"game_plat_id";
NSString *const kGameDetailGameIsCn = @"is_cn";
NSString *const kGameDetailGamePlatform = @"platform";
NSString *const kGameDetailGameIsFamous = @"is_famous";
NSString *const kGameDetailGameImages = @"images";
NSString *const kGameDetailGamePlatformId = @"platform_id";
NSString *const kGameDetailGameRate = @"rate";
NSString *const kGameDetailGamePlayingn = @"playingn";
NSString *const kGameDetailGamePlayedn = @"playedn";


@interface GameDetailGame ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GameDetailGame

@synthesize officialId = _officialId;
@synthesize gameId = _gameId;
@synthesize raten = _raten;
@synthesize isDuzhan = _isDuzhan;
@synthesize commentn = _commentn;
@synthesize coverImg = _coverImg;
@synthesize isUpcoming = _isUpcoming;
@synthesize wannan = _wannan;
@synthesize strategyConfigUrl = _strategyConfigUrl;
@synthesize psnid = _psnid;
@synthesize gamePlatId = _gamePlatId;
@synthesize isCn = _isCn;
@synthesize platform = _platform;
@synthesize isFamous = _isFamous;
@synthesize images = _images;
@synthesize platformId = _platformId;
@synthesize rate = _rate;
@synthesize playingn = _playingn;
@synthesize playedn = _playedn;


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
            self.officialId = [self objectOrNilForKey:kGameDetailGameOfficialId fromDictionary:dict];
            self.gameId = [[self objectOrNilForKey:kGameDetailGameGameId fromDictionary:dict] intValue];
            self.raten = [[self objectOrNilForKey:kGameDetailGameRaten fromDictionary:dict] intValue];
            self.isDuzhan = [self objectOrNilForKey:kGameDetailGameIsDuzhan fromDictionary:dict];
            self.commentn = [[self objectOrNilForKey:kGameDetailGameCommentn fromDictionary:dict] intValue];
            self.coverImg = [self objectOrNilForKey:kGameDetailGameCoverImg fromDictionary:dict];
            self.isUpcoming = [[self objectOrNilForKey:kGameDetailGameIsUpcoming fromDictionary:dict] boolValue];
            self.wannan = [[self objectOrNilForKey:kGameDetailGameWannan fromDictionary:dict] intValue];
            self.strategyConfigUrl = [self objectOrNilForKey:kGameDetailGameStrategyConfigUrl fromDictionary:dict];
            self.psnid = [self objectOrNilForKey:kGameDetailGamePsnid fromDictionary:dict];
            self.gamePlatId = [[self objectOrNilForKey:kGameDetailGameGamePlatId fromDictionary:dict] intValue];
            self.isCn = [[self objectOrNilForKey:kGameDetailGameIsCn fromDictionary:dict] boolValue];
            self.platform = [self objectOrNilForKey:kGameDetailGamePlatform fromDictionary:dict];
            self.isFamous = [[self objectOrNilForKey:kGameDetailGameIsFamous fromDictionary:dict] boolValue];
    NSObject *receivedGameDetailImages = [dict objectForKey:kGameDetailGameImages];
    NSMutableArray *parsedGameDetailImages = [NSMutableArray array];
    if ([receivedGameDetailImages isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGameDetailImages) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGameDetailImages addObject:[GameDetailImages modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGameDetailImages isKindOfClass:[NSDictionary class]]) {
       [parsedGameDetailImages addObject:[GameDetailImages modelObjectWithDictionary:(NSDictionary *)receivedGameDetailImages]];
    }

    self.images = [NSArray arrayWithArray:parsedGameDetailImages];
            self.platformId = [[self objectOrNilForKey:kGameDetailGamePlatformId fromDictionary:dict] intValue];
            self.rate = [[self objectOrNilForKey:kGameDetailGameRate fromDictionary:dict] intValue];
            self.playingn = [[self objectOrNilForKey:kGameDetailGamePlayingn fromDictionary:dict] intValue];
            self.playedn = [[self objectOrNilForKey:kGameDetailGamePlayedn fromDictionary:dict] intValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.officialId forKey:kGameDetailGameOfficialId];
    [mutableDict setValue:[NSNumber numberWithInt:self.gameId] forKey:kGameDetailGameGameId];
    [mutableDict setValue:[NSNumber numberWithInt:self.raten] forKey:kGameDetailGameRaten];
    [mutableDict setValue:self.isDuzhan forKey:kGameDetailGameIsDuzhan];
    [mutableDict setValue:[NSNumber numberWithInt:self.commentn] forKey:kGameDetailGameCommentn];
    [mutableDict setValue:self.coverImg forKey:kGameDetailGameCoverImg];
    [mutableDict setValue:[NSNumber numberWithBool:self.isUpcoming] forKey:kGameDetailGameIsUpcoming];
    [mutableDict setValue:[NSNumber numberWithInt:self.wannan] forKey:kGameDetailGameWannan];
    [mutableDict setValue:self.strategyConfigUrl forKey:kGameDetailGameStrategyConfigUrl];
    [mutableDict setValue:self.psnid forKey:kGameDetailGamePsnid];
    [mutableDict setValue:[NSNumber numberWithInt:self.gamePlatId] forKey:kGameDetailGameGamePlatId];
    [mutableDict setValue:[NSNumber numberWithBool:self.isCn] forKey:kGameDetailGameIsCn];
    [mutableDict setValue:self.platform forKey:kGameDetailGamePlatform];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFamous] forKey:kGameDetailGameIsFamous];
    NSMutableArray *tempArrayForImages = [NSMutableArray array];
    for (NSObject *subArrayObject in self.images) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForImages addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForImages addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImages] forKey:kGameDetailGameImages];
    [mutableDict setValue:[NSNumber numberWithInt:self.platformId] forKey:kGameDetailGamePlatformId];
    [mutableDict setValue:[NSNumber numberWithInt:self.rate] forKey:kGameDetailGameRate];
    [mutableDict setValue:[NSNumber numberWithInt:self.playingn] forKey:kGameDetailGamePlayingn];
    [mutableDict setValue:[NSNumber numberWithInt:self.playedn] forKey:kGameDetailGamePlayedn];

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

    self.officialId = [aDecoder decodeObjectForKey:kGameDetailGameOfficialId];
    self.gameId = [aDecoder decodeIntForKey:kGameDetailGameGameId];
    self.raten = [aDecoder decodeIntForKey:kGameDetailGameRaten];
    self.isDuzhan = [aDecoder decodeObjectForKey:kGameDetailGameIsDuzhan];
    self.commentn = [aDecoder decodeIntForKey:kGameDetailGameCommentn];
    self.coverImg = [aDecoder decodeObjectForKey:kGameDetailGameCoverImg];
    self.isUpcoming = [aDecoder decodeBoolForKey:kGameDetailGameIsUpcoming];
    self.wannan = [aDecoder decodeIntForKey:kGameDetailGameWannan];
    self.strategyConfigUrl = [aDecoder decodeObjectForKey:kGameDetailGameStrategyConfigUrl];
    self.psnid = [aDecoder decodeObjectForKey:kGameDetailGamePsnid];
    self.gamePlatId = [aDecoder decodeIntForKey:kGameDetailGameGamePlatId];
    self.isCn = [aDecoder decodeBoolForKey:kGameDetailGameIsCn];
    self.platform = [aDecoder decodeObjectForKey:kGameDetailGamePlatform];
    self.isFamous = [aDecoder decodeBoolForKey:kGameDetailGameIsFamous];
    self.images = [aDecoder decodeObjectForKey:kGameDetailGameImages];
    self.platformId = [aDecoder decodeIntForKey:kGameDetailGamePlatformId];
    self.rate = [aDecoder decodeIntForKey:kGameDetailGameRate];
    self.playingn = [aDecoder decodeIntForKey:kGameDetailGamePlayingn];
    self.playedn = [aDecoder decodeIntForKey:kGameDetailGamePlayedn];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_officialId forKey:kGameDetailGameOfficialId];
    [aCoder encodeInt:_gameId forKey:kGameDetailGameGameId];
    [aCoder encodeInt:_raten forKey:kGameDetailGameRaten];
    [aCoder encodeObject:_isDuzhan forKey:kGameDetailGameIsDuzhan];
    [aCoder encodeInt:_commentn forKey:kGameDetailGameCommentn];
    [aCoder encodeObject:_coverImg forKey:kGameDetailGameCoverImg];
    [aCoder encodeBool:_isUpcoming forKey:kGameDetailGameIsUpcoming];
    [aCoder encodeInt:_wannan forKey:kGameDetailGameWannan];
    [aCoder encodeObject:_strategyConfigUrl forKey:kGameDetailGameStrategyConfigUrl];
    [aCoder encodeObject:_psnid forKey:kGameDetailGamePsnid];
    [aCoder encodeInt:_gamePlatId forKey:kGameDetailGameGamePlatId];
    [aCoder encodeBool:_isCn forKey:kGameDetailGameIsCn];
    [aCoder encodeObject:_platform forKey:kGameDetailGamePlatform];
    [aCoder encodeBool:_isFamous forKey:kGameDetailGameIsFamous];
    [aCoder encodeObject:_images forKey:kGameDetailGameImages];
    [aCoder encodeInt:_platformId forKey:kGameDetailGamePlatformId];
    [aCoder encodeInt:_rate forKey:kGameDetailGameRate];
    [aCoder encodeInt:_playingn forKey:kGameDetailGamePlayingn];
    [aCoder encodeInt:_playedn forKey:kGameDetailGamePlayedn];
}

- (id)copyWithZone:(NSZone *)zone
{
    GameDetailGame *copy = [[GameDetailGame alloc] init];
    
    if (copy) {

        copy.officialId = [self.officialId copyWithZone:zone];
        copy.gameId = self.gameId;
        copy.raten = self.raten;
        copy.isDuzhan = [self.isDuzhan copyWithZone:zone];
        copy.commentn = self.commentn;
        copy.coverImg = [self.coverImg copyWithZone:zone];
        copy.isUpcoming = self.isUpcoming;
        copy.wannan = self.wannan;
        copy.strategyConfigUrl = [self.strategyConfigUrl copyWithZone:zone];
        copy.psnid = [self.psnid copyWithZone:zone];
        copy.gamePlatId = self.gamePlatId;
        copy.isCn = self.isCn;
        copy.platform = [self.platform copyWithZone:zone];
        copy.isFamous = self.isFamous;
        copy.images = [self.images copyWithZone:zone];
        copy.platformId = self.platformId;
        copy.rate = self.rate;
        copy.playingn = self.playingn;
        copy.playedn = self.playedn;
    }
    
    return copy;
}


@end
