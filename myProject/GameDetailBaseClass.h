//
//  GameDetailBaseClass.h
//
//  Created by Exception  on 16/5/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GameDetailGameHead, GameDetailGame;

@interface GameDetailBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) int ret;
@property (nonatomic, strong) GameDetailGameHead *gameHead;
@property (nonatomic, strong) GameDetailGame *game;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
