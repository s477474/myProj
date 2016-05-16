//
//  FeedShare.m
//
//  Created by Exception  on 16/5/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FeedShare.h"


NSString *const kFeedShareContent = @"content";
NSString *const kFeedShareTitle = @"title";
NSString *const kFeedShareUrl = @"url";


@interface FeedShare ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FeedShare

@synthesize content = _content;
@synthesize title = _title;
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
            self.content = [self objectOrNilForKey:kFeedShareContent fromDictionary:dict];
            self.title = [self objectOrNilForKey:kFeedShareTitle fromDictionary:dict];
            self.url = [self objectOrNilForKey:kFeedShareUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.content forKey:kFeedShareContent];
    [mutableDict setValue:self.title forKey:kFeedShareTitle];
    [mutableDict setValue:self.url forKey:kFeedShareUrl];

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

    self.content = [aDecoder decodeObjectForKey:kFeedShareContent];
    self.title = [aDecoder decodeObjectForKey:kFeedShareTitle];
    self.url = [aDecoder decodeObjectForKey:kFeedShareUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_content forKey:kFeedShareContent];
    [aCoder encodeObject:_title forKey:kFeedShareTitle];
    [aCoder encodeObject:_url forKey:kFeedShareUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    FeedShare *copy = [[FeedShare alloc] init];
    
    if (copy) {

        copy.content = [self.content copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
