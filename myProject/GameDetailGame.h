//
//  GameDetailGame.h
//
//  Created by Exception  on 16/5/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GameDetailGame : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *officialId;
@property (nonatomic, assign) int gameId;
@property (nonatomic, assign) int raten;
@property (nonatomic, assign) id isDuzhan;
@property (nonatomic, assign) int commentn;
@property (nonatomic, strong) NSString *coverImg;
@property (nonatomic, assign) BOOL isUpcoming;
@property (nonatomic, assign) int wannan;
@property (nonatomic, assign) id strategyConfigUrl;
@property (nonatomic, assign) id psnid;
@property (nonatomic, assign) int gamePlatId;
@property (nonatomic, assign) BOOL isCn;
@property (nonatomic, strong) NSString *platform;
@property (nonatomic, assign) BOOL isFamous;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, assign) int platformId;
@property (nonatomic, assign) int rate;
@property (nonatomic, assign) int playingn;
@property (nonatomic, assign) int playedn;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
