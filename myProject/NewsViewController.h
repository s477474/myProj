//
//  NewsTableViewController.h
//  myProject
//
//  Created by Exception on 16/5/14.
//  Copyright © 2016年 Exception. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsCell.h"
@interface NewsViewController : UIViewController<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) FDSlideBar *slideBar;
@property (strong, nonatomic) UIScrollView* scrollView;
@property (strong, nonatomic) UITableView* tableView1;
@property (strong, nonatomic) UITableView* tableView2;
@property (strong, nonatomic) NSMutableArray<FeedFeeds*> *dataSource;
@property (strong, nonatomic) NSMutableArray<GameDetailBaseClass*> *gameModelArray;
@end
