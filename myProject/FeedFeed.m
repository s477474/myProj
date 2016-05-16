//
//  FeedFeed.m
//
//  Created by Exception  on 16/5/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FeedFeed.h"
#import "FeedFeeds.h"


NSString *const kFeedFeedFeeds = @"feeds";
NSString *const kFeedFeedRet = @"ret";


@interface FeedFeed ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FeedFeed

@synthesize feeds = _feeds;
@synthesize ret = _ret;


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
    NSObject *receivedFeedFeeds = [dict objectForKey:kFeedFeedFeeds];
    NSMutableArray *parsedFeedFeeds = [NSMutableArray array];
    if ([receivedFeedFeeds isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedFeedFeeds) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedFeedFeeds addObject:[FeedFeeds modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedFeedFeeds isKindOfClass:[NSDictionary class]]) {
       [parsedFeedFeeds addObject:[FeedFeeds modelObjectWithDictionary:(NSDictionary *)receivedFeedFeeds]];
    }

    self.feeds = [NSArray arrayWithArray:parsedFeedFeeds];
            self.ret = [[self objectOrNilForKey:kFeedFeedRet fromDictionary:dict] intValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForFeeds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.feeds) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForFeeds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForFeeds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForFeeds] forKey:kFeedFeedFeeds];
    [mutableDict setValue:[NSNumber numberWithInt:self.ret] forKey:kFeedFeedRet];

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

    self.feeds = [aDecoder decodeObjectForKey:kFeedFeedFeeds];
    self.ret = [aDecoder decodeIntForKey:kFeedFeedRet];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_feeds forKey:kFeedFeedFeeds];
    [aCoder encodeInt:_ret forKey:kFeedFeedRet];
}

- (id)copyWithZone:(NSZone *)zone
{
    FeedFeed *copy = [[FeedFeed alloc] init];
    
    if (copy) {

        copy.feeds = [self.feeds copyWithZone:zone];
        copy.ret = self.ret;
    }
    
    return copy;
}


@end
