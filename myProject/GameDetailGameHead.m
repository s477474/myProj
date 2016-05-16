//
//  GameDetailGameHead.m
//
//  Created by Exception  on 16/5/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GameDetailGameHead.h"
#import "GameDetailImages.h"


NSString *const kGameDetailGameHeadName = @"name";
NSString *const kGameDetailGameHeadGameId = @"game_id";
NSString *const kGameDetailGameHeadIntro = @"intro";
NSString *const kGameDetailGameHeadOriginName = @"origin_name";
NSString *const kGameDetailGameHeadPublisher = @"publisher";
NSString *const kGameDetailGameHeadAlias = @"alias";
NSString *const kGameDetailGameHeadLastUpdate = @"last_update";
NSString *const kGameDetailGameHeadDevId = @"dev_id";
NSString *const kGameDetailGameHeadImages = @"images";
NSString *const kGameDetailGameHeadTypes = @"types";
NSString *const kGameDetailGameHeadDeveloper = @"developer";
NSString *const kGameDetailGameHeadLimit = @"limit";
NSString *const kGameDetailGameHeadPubId = @"pub_id";
NSString *const kGameDetailGameHeadNum = @"num";


@interface GameDetailGameHead ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GameDetailGameHead

@synthesize name = _name;
@synthesize gameId = _gameId;
@synthesize intro = _intro;
@synthesize originName = _originName;
@synthesize publisher = _publisher;
@synthesize alias = _alias;
@synthesize lastUpdate = _lastUpdate;
@synthesize devId = _devId;
@synthesize images = _images;
@synthesize types = _types;
@synthesize developer = _developer;
@synthesize limit = _limit;
@synthesize pubId = _pubId;
@synthesize num = _num;


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
            self.name = [self objectOrNilForKey:kGameDetailGameHeadName fromDictionary:dict];
            self.gameId = [[self objectOrNilForKey:kGameDetailGameHeadGameId fromDictionary:dict] intValue];
            self.intro = [self objectOrNilForKey:kGameDetailGameHeadIntro fromDictionary:dict];
            self.originName = [self objectOrNilForKey:kGameDetailGameHeadOriginName fromDictionary:dict];
            self.publisher = [self objectOrNilForKey:kGameDetailGameHeadPublisher fromDictionary:dict];
            self.alias = [self objectOrNilForKey:kGameDetailGameHeadAlias fromDictionary:dict];
            self.lastUpdate = [self objectOrNilForKey:kGameDetailGameHeadLastUpdate fromDictionary:dict];
            self.devId = [[self objectOrNilForKey:kGameDetailGameHeadDevId fromDictionary:dict] intValue];
    NSObject *receivedGameDetailImages = [dict objectForKey:kGameDetailGameHeadImages];
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
            self.types = [self objectOrNilForKey:kGameDetailGameHeadTypes fromDictionary:dict];
            self.developer = [self objectOrNilForKey:kGameDetailGameHeadDeveloper fromDictionary:dict];
            self.limit = [self objectOrNilForKey:kGameDetailGameHeadLimit fromDictionary:dict];
            self.pubId = [[self objectOrNilForKey:kGameDetailGameHeadPubId fromDictionary:dict] intValue];
            self.num = [self objectOrNilForKey:kGameDetailGameHeadNum fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kGameDetailGameHeadName];
    [mutableDict setValue:[NSNumber numberWithInt:self.gameId] forKey:kGameDetailGameHeadGameId];
    [mutableDict setValue:self.intro forKey:kGameDetailGameHeadIntro];
    [mutableDict setValue:self.originName forKey:kGameDetailGameHeadOriginName];
    [mutableDict setValue:self.publisher forKey:kGameDetailGameHeadPublisher];
    [mutableDict setValue:self.alias forKey:kGameDetailGameHeadAlias];
    [mutableDict setValue:self.lastUpdate forKey:kGameDetailGameHeadLastUpdate];
    [mutableDict setValue:[NSNumber numberWithInt:self.devId] forKey:kGameDetailGameHeadDevId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImages] forKey:kGameDetailGameHeadImages];
    [mutableDict setValue:self.types forKey:kGameDetailGameHeadTypes];
    [mutableDict setValue:self.developer forKey:kGameDetailGameHeadDeveloper];
    [mutableDict setValue:self.limit forKey:kGameDetailGameHeadLimit];
    [mutableDict setValue:[NSNumber numberWithInt:self.pubId] forKey:kGameDetailGameHeadPubId];
    [mutableDict setValue:self.num forKey:kGameDetailGameHeadNum];

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

    self.name = [aDecoder decodeObjectForKey:kGameDetailGameHeadName];
    self.gameId = [aDecoder decodeIntForKey:kGameDetailGameHeadGameId];
    self.intro = [aDecoder decodeObjectForKey:kGameDetailGameHeadIntro];
    self.originName = [aDecoder decodeObjectForKey:kGameDetailGameHeadOriginName];
    self.publisher = [aDecoder decodeObjectForKey:kGameDetailGameHeadPublisher];
    self.alias = [aDecoder decodeObjectForKey:kGameDetailGameHeadAlias];
    self.lastUpdate = [aDecoder decodeObjectForKey:kGameDetailGameHeadLastUpdate];
    self.devId = [aDecoder decodeIntForKey:kGameDetailGameHeadDevId];
    self.images = [aDecoder decodeObjectForKey:kGameDetailGameHeadImages];
    self.types = [aDecoder decodeObjectForKey:kGameDetailGameHeadTypes];
    self.developer = [aDecoder decodeObjectForKey:kGameDetailGameHeadDeveloper];
    self.limit = [aDecoder decodeObjectForKey:kGameDetailGameHeadLimit];
    self.pubId = [aDecoder decodeIntForKey:kGameDetailGameHeadPubId];
    self.num = [aDecoder decodeObjectForKey:kGameDetailGameHeadNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kGameDetailGameHeadName];
    [aCoder encodeInt:_gameId forKey:kGameDetailGameHeadGameId];
    [aCoder encodeObject:_intro forKey:kGameDetailGameHeadIntro];
    [aCoder encodeObject:_originName forKey:kGameDetailGameHeadOriginName];
    [aCoder encodeObject:_publisher forKey:kGameDetailGameHeadPublisher];
    [aCoder encodeObject:_alias forKey:kGameDetailGameHeadAlias];
    [aCoder encodeObject:_lastUpdate forKey:kGameDetailGameHeadLastUpdate];
    [aCoder encodeInt:_devId forKey:kGameDetailGameHeadDevId];
    [aCoder encodeObject:_images forKey:kGameDetailGameHeadImages];
    [aCoder encodeObject:_types forKey:kGameDetailGameHeadTypes];
    [aCoder encodeObject:_developer forKey:kGameDetailGameHeadDeveloper];
    [aCoder encodeObject:_limit forKey:kGameDetailGameHeadLimit];
    [aCoder encodeInt:_pubId forKey:kGameDetailGameHeadPubId];
    [aCoder encodeObject:_num forKey:kGameDetailGameHeadNum];
}

- (id)copyWithZone:(NSZone *)zone
{
    GameDetailGameHead *copy = [[GameDetailGameHead alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.gameId = self.gameId;
        copy.intro = [self.intro copyWithZone:zone];
        copy.originName = [self.originName copyWithZone:zone];
        copy.publisher = [self.publisher copyWithZone:zone];
        copy.alias = [self.alias copyWithZone:zone];
        copy.lastUpdate = [self.lastUpdate copyWithZone:zone];
        copy.devId = self.devId;
        copy.images = [self.images copyWithZone:zone];
        copy.types = [self.types copyWithZone:zone];
        copy.developer = [self.developer copyWithZone:zone];
        copy.limit = [self.limit copyWithZone:zone];
        copy.pubId = self.pubId;
        copy.num = [self.num copyWithZone:zone];
    }
    
    return copy;
}


@end
