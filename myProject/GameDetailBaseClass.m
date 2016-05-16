//
//  GameDetailBaseClass.m
//
//  Created by Exception  on 16/5/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GameDetailBaseClass.h"
#import "GameDetailGameHead.h"
#import "GameDetailGame.h"


NSString *const kGameDetailBaseClassRet = @"ret";
NSString *const kGameDetailBaseClassGameHead = @"game_head";
NSString *const kGameDetailBaseClassGame = @"game";


@interface GameDetailBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GameDetailBaseClass

@synthesize ret = _ret;
@synthesize gameHead = _gameHead;
@synthesize game = _game;


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
            self.ret = [[self objectOrNilForKey:kGameDetailBaseClassRet fromDictionary:dict] intValue];
            self.gameHead = [GameDetailGameHead modelObjectWithDictionary:[dict objectForKey:kGameDetailBaseClassGameHead]];
            self.game = [GameDetailGame modelObjectWithDictionary:[dict objectForKey:kGameDetailBaseClassGame]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithInt:self.ret] forKey:kGameDetailBaseClassRet];
    [mutableDict setValue:[self.gameHead dictionaryRepresentation] forKey:kGameDetailBaseClassGameHead];
    [mutableDict setValue:[self.game dictionaryRepresentation] forKey:kGameDetailBaseClassGame];

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

    self.ret = [aDecoder decodeIntForKey:kGameDetailBaseClassRet];
    self.gameHead = [aDecoder decodeObjectForKey:kGameDetailBaseClassGameHead];
    self.game = [aDecoder decodeObjectForKey:kGameDetailBaseClassGame];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeInt:_ret forKey:kGameDetailBaseClassRet];
    [aCoder encodeObject:_gameHead forKey:kGameDetailBaseClassGameHead];
    [aCoder encodeObject:_game forKey:kGameDetailBaseClassGame];
}

- (id)copyWithZone:(NSZone *)zone
{
    GameDetailBaseClass *copy = [[GameDetailBaseClass alloc] init];
    
    if (copy) {

        copy.ret = self.ret;
        copy.gameHead = [self.gameHead copyWithZone:zone];
        copy.game = [self.game copyWithZone:zone];
    }
    
    return copy;
}


@end
