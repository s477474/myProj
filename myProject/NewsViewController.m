//
//  NewsTableViewController.m
//  myProject
//
//  Created by Exception on 16/5/14.
//  Copyright © 2016年 Exception. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()


@end

@implementation NewsViewController

-(void)setTableViewDataSource
{
    self.gameModelArray=[NSMutableArray arrayWithCapacity:0];
    self.gameModelArray1=[NSMutableArray arrayWithCapacity:0];
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    请求数据源

        // something
        [self getDataSourceWithClassId:1 Pn:0];
        [self getDataSourceWithClassId:2 Pn:0];

}



-(void)getDataSourceWithClassId:(int)classId Pn:(int)pn
{
    __block NSMutableArray *array=[NSMutableArray arrayWithCapacity:0];
    [[HttpRequestBox getRequestBox]feedRequestWithClass:classId Pn:pn CallBack:^(NSMutableArray *feedsArray, bool isSuccess) {
        if (isSuccess) {
            if (classId==1) {
                self.dataSource=[NSMutableArray arrayWithArray:[feedsArray sortedArrayUsingComparator:^NSComparisonResult(id  obj1, id  obj2) {
                    return  [obj1 feedId]<[obj2 feedId];
                }]];
            }else{
                self.dataSource1=[NSMutableArray arrayWithArray:[feedsArray sortedArrayUsingComparator:^NSComparisonResult(id  obj1, id  obj2) {
                    return  [obj1 feedId]<[obj2 feedId];
                    }]];
            }
            
            
             ///发送请求的数量
            __block int requestCount=0;
            //            计算feeds中带游戏资料的数量
            __block int k=0;
            for (id feed in feedsArray) {
                if ([feed gamePlatId]==0) {
                    k++;
                }
            }
            //            遍历找出所有需要游戏logo的对象 没有的直接new一个填充
            for (FeedFeeds *feed in (classId==1?self.dataSource:self.dataSource1)) {
                if (feed.gamePlatId==0) {
                    GameDetailBaseClass *game=[GameDetailBaseClass new];
                    game.ret=feed.feedId;
                    @synchronized(self) {
                        requestCount++;
                    }
                    [array addObject:game];
                    continue;
                }
//                           请求游戏model (需要用到game_logo)
                [[HttpRequestBox getRequestBox]gameRequestWithGamePlatId:feed.gamePlatId CallBack:^(GameDetailBaseClass *gameModel, bool isSuccess) {
                    gameModel.ret=feed.feedId;
                        [array addObject:gameModel];
                        if (requestCount>=k) {
                            
                            
                            if (classId==1) {
                                self.gameModelArray=[NSMutableArray arrayWithArray:[array sortedArrayUsingComparator:^NSComparisonResult(GameDetailBaseClass * obj1, GameDetailBaseClass * obj2) {
                                    return obj1.ret<obj2.ret;
                                }]];
                            }else if(classId==2){
                                self.gameModelArray1=[NSMutableArray arrayWithArray:[array sortedArrayUsingComparator:^NSComparisonResult(GameDetailBaseClass * obj1, GameDetailBaseClass * obj2) {
                                    return obj1.ret<obj2.ret;
                                }]];
                            }
                            //所有数据请求完毕,设置tableView数据源
                            NSLog(@"%d",self.gameModelArray1.count);
                            if (self.gameModelArray.count>=20) {
                                 [self reloadTableView:_tableView1];
                            }else if (self.gameModelArray1.count>=20){
                                
                                [self reloadTableView:_tableView2];
                            }
                        }
                }];
            }
        }
    }];
}

#pragma mark - 刷新表
-(void)reloadTableView:(UITableView*)tableView
{
    NSLog(@"%d",tableView.tag);

    tableView.delegate=self;
    tableView.dataSource=self;
    [tableView reloadData];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSlideBar];
    [self configScrollView];
    [self configTableView];
    [self setTableViewDataSource];
}

#pragma mark - 配置ScrollView容器
-(void)configScrollView
{
    self.scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.scrollView.delegate = self;
    self.scrollView.tag = 100;
    self.scrollView.pagingEnabled = YES;
    [self.scrollView setContentSize:CGSizeMake(SCREEN_WIDTH*3, SCREEN_HEIGHT)];
    [self.scrollView setDirectionalLockEnabled:YES];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.scrollView setShowsVerticalScrollIndicator:NO];
    self.scrollView.clipsToBounds = NO;
    [self.view addSubview:self.scrollView];
    
}

#pragma mark - 配置ScrollView上的TableView;

-(void)configTableView
{
    self.tableView1=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-self.tabBarController.tabBar.bounds.size.height) style:UITableViewStylePlain];

    _tableView1.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tableView1.tag=201;
    _tableView1.backgroundColor=[UIColor redColor];
    [_tableView1 registerNib:[UINib nibWithNibName:@"NewsCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    [self.scrollView addSubview:_tableView1];
    
    
    self.tableView2=[[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-self.tabBarController.tabBar.bounds.size.height) style:UITableViewStylePlain];

    _tableView2.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tableView2.tag=202;
    _tableView2.backgroundColor=[UIColor blueColor];
    [_tableView2 registerNib:[UINib nibWithNibName:@"NewsCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    [self.scrollView addSubview:_tableView2];
}
#pragma mark - 设置滑动条
- (void)setupSlideBar {
    FDSlideBar *sliderBar = [[FDSlideBar alloc] initWithFrame:CGRectMake(80, 20, SCREEN_WIDTH-80, 44)];
    sliderBar.backgroundColor = [UIColor colorWithRed:254/255.0 green:221/255.0 blue:57/255.0 alpha:1];
    
//  设置滑动条标题
    sliderBar.itemsTitle = @[@"   PS    ", @"  XBOX ", @"正在玩"];

//  设置滑动条风格
    sliderBar.itemColor = [UIColor blackColor];
    sliderBar.itemSelectedColor = [UIColor blackColor];
    sliderBar.sliderColor = [UIColor magentaColor];
    
//  设置滑动条滑动的回调方法
    [sliderBar slideBarItemSelectedCallback:^(NSUInteger idx) {
        NSLog(@"%d",idx);

        self.scrollView.contentOffset=CGPointMake(SCREEN_WIDTH*idx, 0);
    }];
//    添加到自定义导航栏上
    [[[MainTabBarViewController getMainTabBar]customNavBar] addSubview:sliderBar];
    _slideBar = sliderBar;
}




#pragma mark tableView setting
#pragma mark 设置表的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

#pragma mark - 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FeedFeeds *feed=tableView.tag==1?[self.dataSource objectAtIndex:indexPath.row]:[self.dataSource1 objectAtIndex:indexPath.row];
    float contentHeight=[feed getContentHeight];
    float totalHeight=10+47+8+contentHeight+8+130+8;

    return totalHeight;
}


#pragma mark 设置单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    FeedFeeds *feed=tableView.tag==201?[self.dataSource objectAtIndex:indexPath.row]:[self.dataSource1 objectAtIndex:indexPath.row];
    GameDetailBaseClass *gameModel=nil;
    if (tableView.tag==201) {
        gameModel=[self.gameModelArray objectAtIndex:indexPath.row];
    }else{
        gameModel=[self.gameModelArray1 objectAtIndex:indexPath.row];
    }
    
//    清空cell内容.防止重叠
    cell.textContentLabel.text=nil;
    cell.gameSubTitleLabel.text=nil;
    cell.gameTitleLabel.text=nil;
    [cell.contentImageView setImage:nil];
    [cell.headerImageBtn setBackgroundImage:nil forState:UIControlStateNormal];
    
//    设置cell数据源
    cell.feed=feed;
    cell.gameModel=gameModel;
    [cell setDataSource];
    return cell;
}





#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
//  滑动ScrollView的回调方法
    [self.slideBar selectSlideBarItemAtIndex:scrollView.contentOffset.x/SCREEN_WIDTH];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
