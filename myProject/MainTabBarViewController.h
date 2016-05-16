//
//  MainTabBarViewController.h
//  myProject
//
//  Created by Exception on 16/5/13.
//  Copyright © 2016年 Exception. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInforViewController.h"

@interface MainTabBarViewController : UITabBarController

@property (weak, nonatomic) IBOutlet UIView *customNavBar;
@property(strong,nonatomic)DDMenuController* menuController;
+(id)getMainTabBar;
@end
