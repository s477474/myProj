//
//  HttpRequestBox.m
//  myProject
//
//  Created by Exception on 16/5/15.
//  Copyright © 2016年 Exception. All rights reserved.
//

#import "HttpRequestBox.h"
static HttpRequestBox *requestBox=nil;
@implementation HttpRequestBox

+(id)getRequestBox;
{
    if (requestBox==nil) {
        requestBox=[[HttpRequestBox alloc]init];
        requestBox.sessionManger=[AFHTTPSessionManager manager];
    }
    return requestBox;
}

#pragma mark - 获取新闻列表
-(void)feedRequestWithClass:(int)classNum Pn:(int)pn CallBack:(void(^)(NSMutableArray * feedsArray,bool isSuccess))callBack;
{
    
    NSString *urlString=[NSString stringWithFormat:@"http://api.diershoubing.com:5000/feed/class/%d/?pn=%d&rn=20&src=ios&version=310",classNum,pn];
    [_sessionManger GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *resultFeeds=[NSMutableArray arrayWithCapacity:0];
        for (id feedDic in [responseObject objectForKey:@"feeds"]) {
            FeedFeeds *feed=[FeedFeeds modelObjectWithDictionary: feedDic];
            [resultFeeds addObject:feed];
        }
        if (callBack) {
            callBack(resultFeeds,YES);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark - 根据game_platid获取游戏细节信息
-(void)gameRequestWithGamePlatId:(int)gamePlatId CallBack:(void(^)(GameDetailBaseClass * gameModel,bool isSuccess))callBack;
{

    NSString *urlString=[NSString stringWithFormat:@"http://api.diershoubing.com:5000/game/game_plat/detail/%d/?src=ios&version=310",gamePlatId];
    
    __block GameDetailBaseClass *gameModel=nil;
    [_sessionManger GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        gameModel=[GameDetailBaseClass modelObjectWithDictionary:responseObject];
        if (callBack) {
            callBack(gameModel,YES);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}



@end
