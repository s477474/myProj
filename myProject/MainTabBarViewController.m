//
//  MainTabBarViewController.m
//  myProject
//
//  Created by Exception on 16/5/13.
//  Copyright © 2016年 Exception. All rights reserved.
//

#import "MainTabBarViewController.h"
static MainTabBarViewController *mainTabBar;

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController


+(id)getMainTabBar
{
    if (mainTabBar==nil) {
        mainTabBar=[[MainTabBarViewController alloc]init];
    }
    return mainTabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    mainTabBar=self;
    
    [self setTabBar];
    [self setTabBarItem];
    [self setUserInfo];
    
}

#pragma mark - 设置TabBarItems
-(void)setTabBarItem
{
    NSArray *imageNameArray=@[@"feed~iphone",@"game~iphone",@"playing-1~iphone",@"message~iphone",@"deal-1~iphone",@"feed2~iphone",@"game2~iphone",@"playing2~iphone",@"message2~iphone",@"deal2~iphone"];
    NSMutableArray *imageArray=[NSMutableArray arrayWithCapacity:0];
    for (id imageName in imageNameArray) {
        UIImage *image=[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [imageArray addObject:image];
    }
    for (int i = 0; i<5; i++) {
        id viewController=[self.viewControllers objectAtIndex:i];
        [[viewController tabBarItem] setImage:[imageArray objectAtIndex:i]];
        [[viewController tabBarItem] setSelectedImage:[imageArray objectAtIndex:i+5]];
    }
}





#pragma mark - 设置tabBar

-(void)setTabBar
{
//    设置tabbar背景,字体颜色和字体大小
    UIView *sView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    sView.backgroundColor=[UIColor colorWithRed:43/255.0 green:43/255.0 blue:43/255.0 alpha:1];
    [self.tabBar insertSubview:sView atIndex:0];
    
    self.customNavBar.backgroundColor=[UIColor colorWithRed:254/255.0 green:221/255.0 blue:57/255.0 alpha:1.0];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:10]} forState:UIControlStateNormal];
//    调整自定义导航栏的位置 适配
    [self.customNavBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.offset(-20);
        make.height.offset(64);
    }];
}

#pragma mark - DDMenu
-(void)setUserInfo
{
//    创建DDMenuControler作为根视图
    self.menuController=[[DDMenuController alloc]initWithRootViewController:self.navigationController];
//    设置左边viewcontroller属性
    UserInforViewController *userInfoVC=[UserInforViewController new];
    self.menuController.leftViewController=userInfoVC;
    userInfoVC.view.backgroundColor=[UIColor magentaColor];
    [UIApplication sharedApplication].delegate.window.rootViewController=self.menuController;
}

#pragma mark - 点击显示侧边栏个人菜单

-(void)showUserInfo
{
    [_menuController showLeftController:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
