//
//  GameDetailImages.m
//
//  Created by Exception  on 16/5/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GameDetailImages.h"


NSString *const kGameDetailImagesImgId = @"img_id";
NSString *const kGameDetailImagesType = @"type";
NSString *const kGameDetailImagesUrl = @"url";


@interface GameDetailImages ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GameDetailImages

@synthesize imgId = _imgId;
@synthesize type = _type;
@synthesize url = _url;


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
            self.imgId = [[self objectOrNilForKey:kGameDetailImagesImgId fromDictionary:dict] intValue];
            self.type = [self objectOrNilForKey:kGameDetailImagesType fromDictionary:dict];
            self.url = [self objectOrNilForKey:kGameDetailImagesUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithInt:self.imgId] forKey:kGameDetailImagesImgId];
    [mutableDict setValue:self.type forKey:kGameDetailImagesType];
    [mutableDict setValue:self.url forKey:kGameDetailImagesUrl];

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

    self.imgId = [aDecoder decodeIntForKey:kGameDetailImagesImgId];
    self.type = [aDecoder decodeObjectForKey:kGameDetailImagesType];
    self.url = [aDecoder decodeObjectForKey:kGameDetailImagesUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeInt:_imgId forKey:kGameDetailImagesImgId];
    [aCoder encodeObject:_type forKey:kGameDetailImagesType];
    [aCoder encodeObject:_url forKey:kGameDetailImagesUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    GameDetailImages *copy = [[GameDetailImages alloc] init];
    
    if (copy) {

        copy.imgId = self.imgId;
        copy.type = [self.type copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
