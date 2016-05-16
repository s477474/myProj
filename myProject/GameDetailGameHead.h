//
//  GameDetailGameHead.h
//
//  Created by Exception  on 16/5/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GameDetailGameHead : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int gameId;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSString *originName;
@property (nonatomic, strong) NSString *publisher;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, strong) NSString *lastUpdate;
@property (nonatomic, assign) int devId;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSString *types;
@property (nonatomic, strong) NSString *developer;
@property (nonatomic, strong) NSString *limit;
@property (nonatomic, assign) int pubId;
@property (nonatomic, strong) NSString *num;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
