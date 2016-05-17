//
//  HttpRequestBox.h
//  myProject
//
//  Created by Exception on 16/5/15.
//  Copyright © 2016年 Exception. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "FeedDataModels.h"
#import "GameDetailDataModels.h"
@interface HttpRequestBox : NSObject

@property (strong, nonatomic) NSDateFormatter *formatter;
@property (strong, nonatomic) AFHTTPSessionManager* sessionManger;
+(id)getRequestBox;

/**
 *  资讯页面请求
 *
 *  @param Class    新闻类别 1:PS 2:XBOX
 *  @param pn       页数
 *  @param CallBack 请求到数据的回调方法
 */
-(void)feedRequestWithClass:(int)classNum Pn:(int)pn CallBack:(void(^)(NSMutableArray * feedsArray,bool isSuccess))CallBack;

/**
 *  请求游戏详细信息
 *
 *  @param gamePlatId 游戏平台id
 *  @param callBack   请求成功的回调 带一个GameDetailBaseClass对象
 */
-(void)gameRequestWithGamePlatId:(int)gamePlatId CallBack:(void(^)(GameDetailBaseClass * gameModel,bool isSuccess))callBack;
@end
